select distinct sitename,state
from {{ ref('networks') }}
limit 50
