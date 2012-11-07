# Data-Engineering Overview by *shawman777*

This is a simple Rails application that authenticates users with *OpenID*. After a userhas been authenticated, they are
able upload a file according to a predefined format. After the file has been successfully uploaded it is then imported
into the database. The total amount of purchases they were imported are then displayed with the file information.


## What is used

* Ruby 1.9.2
* DB: Sqlite3
* Dev Server: Mongrel (works)
** (WEBrick breaks OpenID authentication)

# Gems installed with bundle

* rails 3.2.6
* sqlite3
* jquery-rails
* jquery-fileupload-rails
* paperclip
* omniauth-openid


## Installation Steps

* Uses sqlite3 for Development purposes
* git clone repo
* bundle install
* bundle exec rake db:create
* bundle exec rake db:migrate

## Application Launch specifics

* ruby script/rails server mongrel -p 3000 -e development
** There is a known issue with WEBrick not accepting authentication callback

## OpenID example urls

- Google: https://www.google.com/accounts/o8/id
- Yahoo: yahoo.com
- AOL: openid.aol.com

The current authentication process will only allow a single OpendID per user.


# Upload files with jQuery File Upload and Paperclip

This is an example app that uses the following gems to upload files for your Rails application:

# Credits
* Tors Dalid - Example application which is the basis of this solution
* Tors Dalid - "jquery-fileupload-rails" gem
* Sebastian Tschan for writing an awesome file upload plugin.
* thoughtbot, inc for the paperclip gem
* Erik Michaels-Ober for omniauth-openid gem


## License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
