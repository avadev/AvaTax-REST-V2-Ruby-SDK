The AvaTax Ruby Gem
====================
A Ruby wrapper for the AvaTax REST V2 APIs

Installation
------------
	gem install avatax

Simple example
-------------------------
	createTransactionModel = {
		"type" => 'SalesInvoice',
		"companyCode" => '12670',
		"date" => '2017-06-05',
		"customerCode" => 'ABC',
		"addresses" => {
			"ShipFrom" => {
				"line1" => "123 Main Street",
				"city" => "Irvine",
				"region" => "CA",
				"country" => "US",
				"postalCode" => "92615"
			},
			"ShipTo" => {
				"line1" => "100 Market Street",
				"city" => "San Francisco",
				"region" => "CA",
				"country" => "US",
				"postalCode" => "94105"
			}
		},
		"lines" => [ { "amount" => 100 }]
	}
	transaction = @client.create_transaction(createTransactionModel)


If you'd like to see a more complete and complex example, check out our [example folder](/example).

AvaTax REST and Search APIs
------------------------------
Our [developer site](https://developer.avalara.com/) documents all the AvaTax REST and other APIs. Subscribe to the [RSS feed](developer.avalara.com/feed.xml) to stay up to date on the lates news and announcements.

[API docs](http://www.rubydoc.info/github/avadev/AvaTax-REST-V2-Ruby-SDK/)

Blog
----------------------------
The [Developer Blog](https://developer.avalara.com/blog/) features news and important announcements about the AvaTax Platform and SDKs. You will also find tutorials and best practices to help you build great platform integrations.

Contributing
------------
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by closing [issues](https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK/issues)
* by reviewing patches


Submitting an Issue
-------------------
We use the [GitHub issue tracker](https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK/issues) to track bugs and
features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issue by voting it up. When submitting a
bug report, please include a [Gist](http://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
-------------------------
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run <tt>rake doc:yard</tt>. If your changes are not 100% documented, go back to step 4.
6. Add specs for your feature or bug fix.
7. Commit and push your changes.
8. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)

Build Status
------------
[![Build Status](https://travis-ci.org/avadev/AvaTax-REST-V2-Ruby-SDK.svg?branch=master)](https://travis-ci.org/avadev/AvaTax-REST-V2-Ruby-SDK)

Copyright
---------
Copyright (c) 2017, Avalara, Inc. All rights reserved.
By contributing to AvaTax Ruby Gem, you agree that your contributions will be licensed under its Apache License.
See [LICENSE](https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK/) for details.
