## dbt learning
### Setup
- set up **dbt** using the [installation guide](https://github.com/cityblock/mixer/tree/master/dbt#installation) found in `mixer/dbt`
- use the `dbt_env` conda environment
- Installed the **Better Jinja** VSCode extension and select `Jinja SQL` as the syntax highlighter

---
### Using Jinja
- following along with the dbt tutorial [here](https://docs.getdbt.com/tutorial/using-jinja)
- used `dbt init` to initialize the project
- seeded data for the project by putting csv file under the `data/` directory
- look at the code using Jinja in the `models/` directory alongside the compiled code in `target/compiled/jinja_practice/models` to see how the Jinja code is compiled to plain SQL
    - run `dbt compile` to do the compilation
- Jinja macros are like Python functions in that they provide reusable pieces of code
    - macros can be found under the `macros/` directory
- To use an external package like `dbt_utils`, add it to the `package.yml` file in the root directory of the project