with cte_unpivoted as ( {{ dbt_utils.unpivot(
  relation=ref('networks'),
  cast_to='varchar',
  exclude=['sitename'],
  remove=['town_city','countyname','state','zipcode','areacode','room_suite','address','countyfips','latitude','longitude','phonenumber','designatedservice','npi','licensenumber_facilityoperatingcertificate','pfi','medicaidprovideridentificationnumber','service1','service2','service3','service4','service5','service6','service7','service8','service9','service10','service11','service12','service13','service14','service15','service16','service17','service18','service19','service20','service21','service22','service23','service24','service25','nysohmedicalnetworkindicator1','nysohmedicalnetworkindicator2','nysohmedicalnetworkindicator3','nysohmedicalnetworkindicator4','nysohmedicalnetworkindicator5','nysohmedicalnetworkindicator6','nysohmedicalnetworkindicator7','nysohmedicalnetworkindicator8','nysohmedicalnetworkindicator9','servicingcounty1','servicingcounty2','servicingcounty3','servicingcounty4','servicingcounty5','oasasprogramreportingunitnumber','oasasprovidernumber','omhid','planname','providernetworkdatasystemidentificationnumber','quarter_year'],
  field_name='lob_indicator_name',
  value_name='lob_indicator_value'
) }} )

select distinct p.sitename, lob_indicator_name  from cte_unpivoted inner join {{ref('providers')}} p
on p.sitename = cte_unpivoted.sitename
where lob_indicator_value = '1'
