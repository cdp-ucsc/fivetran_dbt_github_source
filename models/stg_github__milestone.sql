with milestone as (

    select *
    from {{ ref('stg_github__milestone_tmp') }}

), macro as (
    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_github_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_github_source/macros/).

        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__milestone_tmp')),
                staging_columns=get_milestone_columns()
            )
        }}

    from milestone 

), fields as (

    select 
        id as milestone_id,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        number as milestone_number,
        state,
        title,
        description,
        is_deleted,
        cast(closed_at as {{ dbt.type_timestamp() }}) as closed_at,
        cast(due_on as {{ dbt.type_timestamp() }}) as due_on,
        repository_id,
        creator_id,
        _fivetran_synced

    from macro

)

select * 
from fields