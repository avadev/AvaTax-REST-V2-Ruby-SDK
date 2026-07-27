module AvaTax
  class Client
    module Jobs 


      # Create a new job for a company
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param model [Object] The job to create
      # @return [Object]
      def create_job(companyId, model)        path = "/api/v2/companies/#{companyId}/jobs"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create a new phase on a job
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param model [Object] The phase to create
      # @return [Object]
      def create_job_phase(companyId, jobId, model)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create a new task on a phase
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param phaseId [Integer] The unique ID number of the phase
      # @param model [Object] The task to create
      # @return [Object]
      def create_job_task(companyId, jobId, phaseId, model)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases/#{phaseId}/tasks"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete a job
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param id [Integer] The unique ID number of the job to delete
      # @return [Object]
      def delete_job(companyId, id)        path = "/api/v2/companies/#{companyId}/jobs/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

      # Delete a phase from a job
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param phaseId [Integer] The unique ID number of the phase to delete
      # @return [Object]
      def delete_job_phase(companyId, jobId, phaseId)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases/#{phaseId}"
        delete(path, {}, AvaTax::VERSION)      end

      # Delete a task from a phase
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param phaseId [Integer] The unique ID number of the phase
      # @param taskId [Integer] The unique ID number of the task to delete
      # @return [Object]
      def delete_job_task(companyId, jobId, phaseId, taskId)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases/#{phaseId}/tasks/#{taskId}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a single job
      #
      # Retrieve a single job by its unique ID.
      #
      # A job represents construction or project work that exemption certificates can be associated with. Each
      # job can contain one or more phases, and each phase can contain one or more tasks.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * phases - Retrieves the list of phases for this job.
      # * tasks - Retrieves the list of tasks within each phase. Tasks are nested under phases, so requesting `tasks` will also expand `phases`.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param id [Integer] The unique ID number of the job
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * phases - Retrieves the list of phases for this job.   * tasks - Retrieves the list of tasks within each phase. Tasks are nested under phases, so requesting `tasks` will also expand `phases`.
      # @return [Object]
      def get_job(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/jobs/#{id}"
        get(path, options, AvaTax::VERSION)      end

      # List all jobs for a company
      #
      # List all jobs recorded by a company.
      #
      # A job represents construction or project work that exemption certificates can be associated with. Each
      # job can contain one or more phases, and each phase can contain one or more tasks.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * phases - Retrieves the list of phases for each job.
      # * tasks - Retrieves the list of tasks within each phase. Tasks are nested under phases, so requesting `tasks` will also expand `phases`.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * phases - Retrieves the list of phases for each job.   * tasks - Retrieves the list of tasks within each phase. Tasks are nested under phases
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exposureZone, phases
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_jobs(companyId, options={})        path = "/api/v2/companies/#{companyId}/jobs"
        get(path, options, AvaTax::VERSION)      end

      # Update an existing job
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param id [Integer] The unique ID number of the job to update
      # @param model [Object] The updated job data
      # @return [Object]
      def update_job(companyId, id, model)        path = "/api/v2/companies/#{companyId}/jobs/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end

      # Update an existing phase on a job
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param phaseId [Integer] The unique ID number of the phase
      # @param model [Object] The updated phase data
      # @return [Object]
      def update_job_phase(companyId, jobId, phaseId, model)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases/#{phaseId}"
        put(path, model, {}, AvaTax::VERSION)      end

      # Update an existing task on a phase
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company
      # @param jobId [Integer] The unique ID number of the job
      # @param phaseId [Integer] The unique ID number of the phase
      # @param taskId [Integer] The unique ID number of the task
      # @param model [Object] The updated task data
      # @return [Object]
      def update_job_task(companyId, jobId, phaseId, taskId, model)        path = "/api/v2/companies/#{companyId}/jobs/#{jobId}/phases/#{phaseId}/tasks/#{taskId}"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end