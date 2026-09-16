module AvaTax
  class Client
    module CustomRules 


      # Create a new custom rule
      #
      # Creates a new custom rule object attached to this company.
      #
      # Custom rules modify the default AvaTax behavior during tax calculation, customizing it to
      # match requirements specific to your business. Rules can be used to change the taxability of
      # an item, change the tax base of an item, alter the tax rate, modify transaction fields
      # and addresses, allocate and split line items, update the location code, and more.
      #
      # Please use custom rules carefully and ensure they match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ---
      #
      # Rules are built from modular _components_. A component can be a rule-wide variable or a
      # _node_ in the directed acyclic graph defining the rule's behavior. To build a rule from scratch,
      # start with `GetCustomRuleComponents` to retrieve supported components and the JSON `dataSchema` for each.
      #
      # Ensure each component has a unique `id` (for _Variable_ components, this is its name) and that its `data` field conforms to the node subtype's `dataSchema`.
      # The `data` must be a single-escaped JSON string, not a nested object. Do not quote numbers or booleans, use only valid enumeration values, and keep
      # arrays arrays even if they only contain a single element.
      #
      # _Nodes_ may be _Conditions_ or _Actions_. When deciding which node to use, prefer nodes for specific use cases,
      # such as `MatchAddress` and `UpdateAddress`, over generic ones `MatchField` and `UpdateField` when possible.
      #
      # Use the `GetCustomRuleFields` endpoint to query the fields that can be used in nodes which accept arbitrary fields, such as `MatchField` and `UpdateField`.
      #
      # Each node defines its outgoing edges by specifying its child node IDs in the `next` array. The result of a node execution is a set of matches
      # (e.g. which lines on the document met the criteria). Node results behave as follows:
      # - Sequences *intersect* their results ("AND")
      # - Branches *propagate* their results as the input to each child
      # - Merges *union* their results ("OR")
      #
      # The `scope` of a condition is what part of the transaction it operates on: `Document`, `SomeLines`, `OneLine`, `AllLines`, or `NoLines`.
      # The `scope` of an action determines what part of the transaction to apply changes to: `Document`, `MatchedLines`, `NotMatchedLines`, or `AllLines`.
      #
      # When using a rule to adjust taxability,
      # - To exempt a line from tax entirely, use an `UpdateField` node to set its tax code to `NT` (Avalara's standard non-taxable code).
      #  - Place the UpdateField early in the rule so it takes effect pre-calculation.
      # - To impact tax details, the MatchTax condition node is required to match on jurisdiction + tax type combinations.
      #  - There can only be one MatchTax node per rule, but it can have more than one criteria set.
      #  - Each criteria set has `matchTaxId` (unique identifier), `country`, `region`, `jurisdictionTypeId`, `jurisCode`, `taxTypeCode`, `taxSubType`, and `rateTypeCode`.
      # - Tax subtypes and rate types may be wildcard (`*` or `ALL`) for most rule types.
      # - Always use full names for `jurisdictionTypeId` (`Country`, `State`, `City`, `County`, `Special`) instead of their abbreviations.
      #  - A wildcard jurisdiction code (`*` or `ALL`) applies the treatment to all jurisdictions of the given `jurisdictionTypeId`.
      # - `TaxRule*` action nodes define how the tax is to be adjusted.
      #  - `TaxRuleProductTaxability`: sets an item's taxability and assigns its rate type, so it requires a specific (non-wildcard) `rateTypeCode`.
      #  - `TaxRuleRateOverride`: overrides Avalara's tax rate.
      #  - `TaxRuleBaseOverride`: changes the tax base as a proportion of the original amount (e.g. `0.5` = 50% taxable).
      #  - `TaxRuleExemptEntity`: exempts the matched line for the jurisdiction and tax type; typically paired with a MatchEntityUseCode condition.
      # - Caps and thresholds can be applied with the `TaxRuleProductTaxability` or `TaxRuleRateOverride` actions.
      #  - A threshold buckets amounts up to and including the threshold as non-taxable.
      #  - A cap limits the taxable amount (per unit by default, multiplied by quantity); amounts above the cap become non-taxable.
      #  - Add the `Document` option to apply the cap across all matching lines of the document.
      # - A `default` value must be provided in `TaxRule*` nodes. Overrides for specific jurisdictions are optional and provided in an `overrides` array (NOT a dictionary).
      #  - If the tax treatment (rate, taxability, etc.) is the same for all configured jurisdictions, set only the `default` value and omit `overrides`.
      #  - You only need to set overrides for values that differ from the default.
      #  - If a `matchTaxId` member is present in an override, it will apply to the corresponding criteria in the MatchTax node.
      #  - If a `matchTaxId` member is NOT present in an override, pattern matching is performed on the override criteria fields with omitted fields treated as wildcards.
      # - When multiple tax rules apply, a more specific tax type/subtype beats a wildcard, and the latest effective date wins.
      # - A Tax Code and Tariff Code condition are mutually exclusive.
      # - Expressions cannot be used in nodes which directly affect tax treatment.
      #
      # Some nodes support _expressions_, which may have variable values evaluated at transaction time.
      # Expression-supporting fields should be indicated on the node's data schema. Expressions allow
      # formulas using arithmetic, substitutions, and references to transaction fields; for example:
      # - `{{Document.TotalAmount}} * 0.1` (10% of the total document amount)
      # - `{{Line.UserDefinedFields.Udf8}}` (Line-level user-defined field 8)
      # - `{{Line.Ref1}}{{Line.Ref2}}` (A line's Ref1 and Ref2 values concatenated)
      # - `2 + {{MyVar}}` (The value of the "MyVar" variable defined elsewhere in the rule, plus 2)
      #
      # Use the `GetCustomRuleTokens` endpoint to enumerate or search for valid tokens that can be used in expressions.
      #
      # Lookup files / reference lists may be used where expressions are supported. Use the syntax `{{FileName.ColumnName}}` to match against
      # a column in a Condition and use the value from another column in the matched row in an Action. Matching scopes must be compatible -
      # line-level matches cannot be used to update a document-level field.
      #
      # Rule nodes are assigned execution steps based on their contents and surrounding nodes. For instance, nodes that follow tax
      # rule actions (`TaxRule*`) or require a calculated field (such as taxable amount) are executed after tax calculation instead
      # of before calculation. Not every node type may execute in every step. Place them accordingly to their `validSteps`.
      # A rule will be rejected if an ordering cannot be resolved. Rules execute in the following stages:
      # - `OnRequest`: On the API request values, before document validation.
      # - `AfterAddressValidation`: After addresses have been geo-coded / validated once.
      # - `AfterSourcing`: After jurisdictions and tax types have been evaluated, but before tax calculation.
      # - `AfterDetails`: After tax calculation details have been generated.
      # - `OnResponse`: After the document has been saved, if applicable; on the API response only.
      #
      # ---
      #
      # It is recommended to validate the rule with the `ValidateCustomRule` endpoint before creating it.
      # This will let you review the rule's execution plan and any associated diagnostic information before saving it.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to create the rule for.
      # @param model [Object] The rule you wish to create.
      # @return [Object]
      def create_custom_rule(companyId, model)        path = "/api/v2/companies/#{companyId}/customrules"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete a custom rule
      #
      # Delete a single custom rule object attached to this company.
      #
      # To maintain tax calculation consistency for recalculation of backdated transactions, it is
      # recommended to expire a rule (set a definite end date) instead of deleting it when the rule
      # requirements remain accurate for a past time period. This will keep the old version of the
      # rule active for that time period so historical transactions re-calculate with the appropriate rule.
      #
      # If only minor changes are required (i.e. the overall purpose of the rule does not change),
      # and historical transactions would not be significantly impacted by the update, prefer using
      # the UpdateCustomRule operation instead of deleting and re-creating the rule.
      #
      # Please use custom rules carefully and ensure they match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns the rule.
      # @param id [Integer] The ID of the rule to delete.
      # @return [ErrorDetail[]]
      def delete_custom_rule(companyId, id)        path = "/api/v2/companies/#{companyId}/customrules/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

      # Export custom rules for a company
      #
      # Export all rule objects defined for this company as a portable JSON envelope.
      #
      # The export set can be filtered and paginated using the same query parameters
      # as the `ListCustomRules` endpoint.
      #
      # This endpoint uses OData filter syntax in order to support querying nested properties;
      # note the following differences from standard AvaTax filtering:
      # - Instead of the infix form, use the contains() function, e.g. `contains(description, 'Amount')`
      # - Query collection fields with the any()/all() lambda operators, e.g. `subtype/any(r: r eq 'UpdateLocationCode')`.
      #
      # The exported envelope can be re-imported into another company or account using the
      # `CreateCustomRulesBatch` endpoint.
      #
      # By default, the export includes all rule types:
      # - Custom Rules, the latest system which provides a new, unified, graph-based interface for engine customization
      # - Advanced Rules, also known as transaction rules, the legacy system for modifying incoming or outgoing transaction fields
      # - Legacy Tax Rules, traditional taxability customization
      #
      # Filtering is applied in two stages: `taxRuleFilter`, `advancedRuleFilter`, and `customRuleFilter` are each
      # applied first, against their respective inner entity type, to select which rules are included. The
      # resulting records are then converted into summary rows, and `filter` is applied afterward against
      # those generated summary records.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to produce a rule export for.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param taxRuleFilter [String] A simple filter statement to select specific TaxRuleModel records. Applied to the underlying   Legacy Tax Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param advancedRuleFilter [String] A simple filter statement to select specific AdvancedRuleExecutionModel records. Applied to the   underlying Advanced Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param customRuleFilter [String] A simple filter statement to select specific CustomRuleOutputModel records. Applied to the   underlying Custom Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [Object]
      def export_custom_rules(companyId, options={})        path = "/api/v2/companies/#{companyId}/customrules/export"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve a single custom rule
      #
      # Retrieves a single custom rule object attached to this company.
      #
      # Use this endpoint to verify the persisted state of a specific rule given its ID,
      # or to fetch the latest, most detailed definition for editing and auditing.
      #
      # Custom rules modify the default AvaTax behavior during tax calculation, customizing it to
      # match requirements specific to your business. Rules can be used to change the taxability of
      # an item, change the tax base of an item, alter the tax rate, modify transaction fields
      # and addresses, allocate and split line items, update the location code, and more.
      #
      # Please use custom rules carefully and ensure they match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns the rule.
      # @param id [Integer] The ID of the rule.
      # @return [Object]
      def get_custom_rule(companyId, id)        path = "/api/v2/companies/#{companyId}/customrules/#{id}"
        get(path, {}, AvaTax::VERSION)      end

      # Fetch a filtered list of components used in custom rule definitions
      #
      # Retrieve a list of supported custom rule components. Start here to enumerate
      # supported Conditions, Actions, and Variables to design rule graphs.
      #
      # A component may be of the following types:
      # - *Conditions*, which are nodes which evaluate transaction-based criteria
      # - *Actions*, which are nodes that change or update a transaction when preceding conditions pass
      # - *Variables*, which are predefined values or expressions with rule-wide scope
      #
      # A component's subtype is the specific kind of condition, action, or variable it is. Examples include:
      # - *Conditions*: MatchField, MatchAddress, MatchCustomerCode, MatchDocumentType, MatchTariffCode, MatchTaxCode, MatchEntityUseCode, MatchTax
      # - *Actions*: UpdateField, UpdateAddress, UpdateLocationCode, TaxRuleRateOverride, TaxRuleBaseOverride, TaxRuleExemptEntity, TaxRuleProductTaxability, AddMessage
      # - *Variables*: Expression, Aggregation
      #
      # The definition of a custom rule is a directed acyclic graph consisting of condition and action nodes.
      # Variable components have rule-wide scope and are not part of the execution graph, but all three
      # component types conform to the same model.
      #
      # The `dataSchema` member is an escaped JSON string which defines, in JSON schema format,
      # the expected structure of the `data` property of any rule component with the corresponding `subtype`.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to retrieve supported definitions for.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_custom_rule_components(companyId, options={})        path = "/api/v2/companies/#{companyId}/customrules/definitions/components"
        get(path, options, AvaTax::VERSION)      end

      # Fetch a filtered list of transaction fields supported by custom rules
      #
      # Query the transaction properties which may be used in custom rules.
      #
      # The following metadata is also included for each property:
      # - A display name and description
      # - The data type
      # - Whether it exists at document and/or line level
      # - Whether it can be read from and/or written to
      # - Whether it is only available in certain steps; examples of such restrictions include: only after address validation, only after tax calculation
      #
      # Note that the name of a field may differ between the rule system and the raw transaction models
      # due to the abstractions the rules system provides. The values returned by this endpoint should
      # be considered authoritative in all custom rules contexts, including:
      # - Components which accept field names, such as `MatchField` and `UpdateField`
      # - In variable expressions; see also `GetCustomRuleTokens`
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to retrieve supported fields for.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_custom_rule_fields(companyId, options={})        path = "/api/v2/companies/#{companyId}/customrules/definitions/fields"
        get(path, options, AvaTax::VERSION)      end

      # Construct an empty template for a rule definition
      #
      # Generate a starter graph with empty nodes based on parameters specified in the request body.
      #
      # Typically, this is used to initialize an editor interface after selecting basic parameters for rule creation
      # such as the types of conditions and actions to include.
      #
      # Note that this endpoint does not return a complete rule entity, only its behavior definition.
      # The rule definition returned is not guaranteed to pass validation, as most fields for component content are left empty.
      # Fill in any empty fields, then call `ValidateCustomRule` to validate and `CreateCustomRule` to persist.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company
      # @param model [Object] The template request
      # @return [Object]
      def get_custom_rule_template(companyId, model)        path = "/api/v2/companies/#{companyId}/customrules/definitions/template"
        post(path, model, {}, AvaTax::VERSION)      end

      # Fetch a filtered list of supported custom rule expression tokens
      #
      # Query the list of supported tokens for use in custom rule expressions.
      #
      # Some rule components support _expressions_, which may have variable values evaluated
      # each time the rule runs on a transaction. An _expression token_ is a sequence delimited
      # by double braces, such as `{{Document.Description}}`, which refers to a variable value
      # and evaluates to that value at transaction time when used within a supporting rule.
      #
      # Expressions can contain formulas using many of these tokens. For example, the expression
      # `{{Document.TotalAmount}} * 0.1` evaluates to 10% of the total document amount for
      # the current transaction.
      #
      # Supported tokens include all readable transaction fields, including parameters and user-defined fields,
      # as well as company-specific reference lists. Examples of the different token types include:
      # - Document-level fields: `{{Document.CustomerCode}}`
      # - Line-level fields: `{{Line.TaxCode}}`
      # - Rule-wide variables: `{{MyVar}}`
      # - Company lookup files: `{{FileName.ColumnName}}`
      #
      # String-type tokens support _functions_, which can be used for transforming the evaluated value:
      # - `Substring(start, length)`: Extract up to `length` characters starting at 0-based index `start`; omit `length` to read to end
      # - `Trim(str)`: Trim complete occurrences of `str` from the beginning and end of the string; omit `str` to trim whitespace
      #
      # Place functions inside the braces, e.g. `{{Line.Ref1.Substring(1,2)}}`.
      #
      # When using expressions in escaped JSON component `data`, include them verbatim inside the
      # JSON string value. Only escape the surrounding double quotes required by JSON.
      # Do not double-escape the braces in `{{...}}`.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to retrieve supported tokens for.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_custom_rule_tokens(companyId, options={})        path = "/api/v2/companies/#{companyId}/customrules/definitions/tokens"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all custom rules for a company
      #
      # Query the custom rule objects defined for this company.
      #
      # This endpoint uses OData filter syntax in order to support querying nested properties;
      # note the following differences from standard AvaTax filtering:
      # - Instead of the infix form, use the contains() function, e.g. `contains(description, 'Amount')`
      # - Query collection fields with the any()/all() lambda operators, e.g. `subtype/any(r: r eq 'UpdateLocationCode')`.
      #
      # By default, all rule types are included:
      # - Custom Rules, the latest system which provides a new, unified, graph-based interface for engine customization
      # - Advanced Rules, also known as transaction rules, the legacy system for modifying incoming or outgoing transaction fields
      # - Legacy Tax Rules, traditional taxability customization
      #
      # Note that not every rule type supports every field in `CustomRuleSummaryModel`, so information
      # unavailable for that rule type may be omitted.
      #
      # Filtering is applied in two stages: `taxRuleFilter`, `advancedRuleFilter`, and `customRuleFilter` are each
      # applied first, against their respective inner entity type, to select which rules are included. The
      # resulting records are then converted into summary rows, and `filter` is applied afterward against
      # those generated `CustomRuleSummaryModel` summary records.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to query the custom rules for.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subtypeDescription, ruleEntity
      # @param taxRuleFilter [String] A simple filter statement to select specific TaxRuleModel records. Applied to the underlying   Legacy Tax Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param advancedRuleFilter [String] A simple filter statement to select specific AdvancedRuleExecutionModel records. Applied to the   underlying Advanced Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param customRuleFilter [String] A simple filter statement to select specific CustomRuleOutputModel records. Applied to the   underlying Custom Rule entities before they are converted into summary records; evaluated before `filter`.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param includeEntities [Boolean] Whether or not to include the full entity definitions in the response; otherwise, only summary information is returned.
      # @return [FetchResult]
      def list_custom_rules(companyId, options={})        path = "/api/v2/companies/#{companyId}/customrules/summary"
        get(path, options, AvaTax::VERSION)      end

      # Update a custom rule
      #
      # Updates an existing custom rule object attached to this company.
      # The rule's ID must be supplied in the request body and must match the request URL path.
      #
      # Prefer updating an existing rule over deletion and re-creation when the overall purpose of the rule is not changing.
      # If required to keep different versions of a rule active (e.g. so historical transactions recalculate consistently),
      # use this endpoint to set an explicit expiry date (end date) for a rule to limit its effective range.
      #
      # Custom rules modify the default AvaTax behavior during tax calculation, customizing it to
      # match requirements specific to your business. Rules can be used to change the taxability of
      # an item, change the tax base of an item, alter the tax rate, modify transaction fields
      # and addresses, allocate and split line items, update the location code, and more.
      #
      # Please use custom rules carefully and ensure they match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ---
      #
      # Rules are built from modular _components_. A component can be a rule-wide variable or a
      # _node_ in the directed acyclic graph defining the rule's behavior. To build a rule from scratch,
      # start with `GetCustomRuleComponents` to retrieve supported components and the JSON `dataSchema` for each.
      #
      # Ensure each component has a unique `id` (for _Variable_ components, this is its name) and that its `data` field conforms to the node subtype's `dataSchema`.
      # The `data` must be a single-escaped JSON string, not a nested object. Do not quote numbers or booleans, use only valid enumeration values, and keep
      # arrays arrays even if they only contain a single element.
      #
      # _Nodes_ may be _Conditions_ or _Actions_. When deciding which node to use, prefer nodes for specific use cases,
      # such as `MatchAddress` and `UpdateAddress`, over generic ones `MatchField` and `UpdateField` when possible.
      #
      # Use the `GetCustomRuleFields` endpoint to query the fields that can be used in nodes which accept arbitrary fields, such as `MatchField` and `UpdateField`.
      #
      # Each node defines its outgoing edges by specifying its child node IDs in the `next` array. The result of a node execution is a set of matches
      # (e.g. which lines on the document met the criteria). Node results behave as follows:
      # - Sequences *intersect* their results ("AND")
      # - Branches *propagate* their results as the input to each child
      # - Merges *union* their results ("OR")
      #
      # The `scope` of a condition is what part of the transaction it operates on: `Document`, `SomeLines`, `OneLine`, `AllLines`, or `NoLines`.
      # The `scope` of an action determines what part of the transaction to apply changes to: `Document`, `MatchedLines`, `NotMatchedLines`, or `AllLines`.
      #
      # When using a rule to adjust taxability,
      # - To exempt a line from tax entirely, use an `UpdateField` node to set its tax code to `NT` (Avalara's standard non-taxable code).
      #  - Place the UpdateField early in the rule so it takes effect pre-calculation.
      # - To impact tax details, the MatchTax condition node is required to match on jurisdiction + tax type combinations.
      #  - There can only be one MatchTax node per rule, but it can have more than one criteria set.
      #  - Each criteria set has `matchTaxId` (unique identifier), `country`, `region`, `jurisdictionTypeId`, `jurisCode`, `taxTypeCode`, `taxSubType`, and `rateTypeCode`.
      # - Tax subtypes and rate types may be wildcard (`*` or `ALL`) for most rule types.
      # - Always use full names for `jurisdictionTypeId` (`Country`, `State`, `City`, `County`, `Special`) instead of their abbreviations.
      #  - A wildcard jurisdiction code (`*` or `ALL`) applies the treatment to all jurisdictions of the given `jurisdictionTypeId`.
      # - `TaxRule*` action nodes define how the tax is to be adjusted.
      #  - `TaxRuleProductTaxability`: sets an item's taxability and assigns its rate type, so it requires a specific (non-wildcard) `rateTypeCode`.
      #  - `TaxRuleRateOverride`: overrides Avalara's tax rate.
      #  - `TaxRuleBaseOverride`: changes the tax base as a proportion of the original amount (e.g. `0.5` = 50% taxable).
      #  - `TaxRuleExemptEntity`: exempts the matched line for the jurisdiction and tax type; typically paired with a MatchEntityUseCode condition.
      # - Caps and thresholds can be applied with the `TaxRuleProductTaxability` or `TaxRuleRateOverride` actions.
      #  - A threshold buckets amounts up to and including the threshold as non-taxable.
      #  - A cap limits the taxable amount (per unit by default, multiplied by quantity); amounts above the cap become non-taxable.
      #  - Add the `Document` option to apply the cap across all matching lines of the document.
      # - A `default` value must be provided in `TaxRule*` nodes. Overrides for specific jurisdictions are optional and provided in an `overrides` array (NOT a dictionary).
      #  - If the tax treatment (rate, taxability, etc.) is the same for all configured jurisdictions, set only the `default` value and omit `overrides`.
      #  - You only need to set overrides for values that differ from the default.
      #  - If a `matchTaxId` member is present in an override, it will apply to the corresponding criteria in the MatchTax node.
      #  - If a `matchTaxId` member is NOT present in an override, pattern matching is performed on the override criteria fields with omitted fields treated as wildcards.
      # - When multiple tax rules apply, a more specific tax type/subtype beats a wildcard, and the latest effective date wins.
      # - A Tax Code and Tariff Code condition are mutually exclusive.
      # - Expressions cannot be used in nodes which directly affect tax treatment.
      #
      # Some nodes support _expressions_, which may have variable values evaluated at transaction time.
      # Expression-supporting fields should be indicated on the node's data schema. Expressions allow
      # formulas using arithmetic, substitutions, and references to transaction fields; for example:
      # - `{{Document.TotalAmount}} * 0.1` (10% of the total document amount)
      # - `{{Line.UserDefinedFields.Udf8}}` (Line-level user-defined field 8)
      # - `{{Line.Ref1}}{{Line.Ref2}}` (A line's Ref1 and Ref2 values concatenated)
      # - `2 + {{MyVar}}` (The value of the "MyVar" variable defined elsewhere in the rule, plus 2)
      #
      # Use the `GetCustomRuleTokens` endpoint to enumerate or search for valid tokens that can be used in expressions.
      #
      # Lookup files / reference lists may be used where expressions are supported. Use the syntax `{{FileName.ColumnName}}` to match against
      # a column in a Condition and use the value from another column in the matched row in an Action. Matching scopes must be compatible -
      # line-level matches cannot be used to update a document-level field.
      #
      # Rule nodes are assigned execution steps based on their contents and surrounding nodes. For instance, nodes that follow tax
      # rule actions (`TaxRule*`) or require a calculated field (such as taxable amount) are executed after tax calculation instead
      # of before calculation. Not every node type may execute in every step. Place them accordingly to their `validSteps`.
      # A rule will be rejected if an ordering cannot be resolved. Rules execute in the following stages:
      # - `OnRequest`: On the API request values, before document validation.
      # - `AfterAddressValidation`: After addresses have been geo-coded / validated once.
      # - `AfterSourcing`: After jurisdictions and tax types have been evaluated, but before tax calculation.
      # - `AfterDetails`: After tax calculation details have been generated.
      # - `OnResponse`: After the document has been saved, if applicable; on the API response only.
      #
      # ---
      #
      # It is recommended to validate the rule with the `ValidateCustomRule` endpoint before updating it.
      # This will let you review the rule's execution plan and any associated diagnostic information before saving it.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns the rule to update.
      # @param id [Integer] The ID of the rule to update. Must match the rule ID passed in the request body.
      # @param model [Object] The new contents of the rule.
      # @return [Object]
      def update_custom_rule(companyId, id, model)        path = "/api/v2/companies/#{companyId}/customrules/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end

      # Validate a custom rule
      #
      # Validates a custom rule and returns a detailed validation result.
      #
      # This endpoint allows running rule validation independently of a create or update operation,
      # enabling checking the validity of a proposed rule without persisting changes.
      # It also returns additional diagnostic information about how a rule will be interpreted by the
      # engine, such as how expressions were parsed and what order the graph nodes will be executed in.
      # Therefore, it can also be used to inspect rule behavior when troubleshooting.
      #
      # Validation messages are categorized into "info," "warning," and "error" severity levels:
      # - Info-level messages provide diagnostic details about how the rule was parsed
      # - Warning-level messages flag potential misconfigurations or scenarios which may cause unexpected behavior
      #  and should be reviewed for intent, but do not block saving the rule
      # - Error-level messages indicate that the rule has an issue that will prevent it from being saved or executed
      #
      # Examples of validation checks which are run include:
      # - Directed acyclic graph structure compliance
      # - Schema conformance for each `data` string
      # - Enumeration value validity, including scope and condition operators
      # - Field existence and step (set/get) constraints
      # - Requirements verification for nodes with prerequisites
      #
      # Validation messages may reference a specific node in their `refersTo` field.
      # If this field is empty, the message is rule-wide.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to validate the rule for.
      # @param model [Object] Rule content to be validated.
      # @return [Object]
      def validate_custom_rule(companyId, model)        path = "/api/v2/companies/#{companyId}/customrules/validate"
        post(path, model, {}, AvaTax::VERSION)      end
    end
  end
end