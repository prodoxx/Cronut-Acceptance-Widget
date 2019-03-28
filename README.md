# Challenge

1. Run `$ bundle`
2. Start up the server: `$ bin/rails s`
3. Visit the root page and follow the instructions

## Usage

You can change the link for the cornuts and donuts by adding a query string parameter to the url for example:

```
http://localhost:3000?cornuts_url=https://google.com
```

 or

 ```
 https://localhost:3000?donuts_url=https://oblip.com
 ```
 or add both like this:

 ```
 https://localhost:3000?cornuts_url=https://google.com&donuts_url=https://oblip.com
 ```
 
## Test

To check that the challenge was solved run the command:

```
rake spec
```

Note: running tests headless requires other libs. See `/spec/spec_helper.rb` line 5.

You can change the app_url in the `config/app.yml` file for different environments

The spec files are under the `/spec` folder.

You can view a GUI report of the spec tests here `tmp/spec-results/index.html`

## Quality Testing

This project comes with three code quality checkers:
1. [Rubocop](https://github.com/rubocop-hq/rubocop)
2. [Reek](https://github.com/troessner/reek)
3. [Flog](https://docs.codeclimate.com/docs/flog)

You can run all of the code quality checkers by running the following rake command:

```
rake quality:all
```

but you can also run them individually like this:

```
rake quality:rubocop
```

Disclaimer: I only did QA testing for the code I wrote and not the Rails generated code.

