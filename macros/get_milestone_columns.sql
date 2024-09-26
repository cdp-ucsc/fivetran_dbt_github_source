{% macro get_milestone_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "number", "datatype": dbt.type_int()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "cloased_at", "datatype": dbt.type_timestamp()},
    {"name": "due_on", "datatype": dbt.type_timestamp()},
    {"name": "repository_id", "datatype": dbt.type_int()},                
    {"name": "creator_id", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
