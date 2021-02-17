with cte_unpivoted as ( {{ dbt_utils.unpivot(
  relation=ref('networks'),
  cast_to='varchar',
  exclude=['sitename'],
  remove=['town_city','countyname','state','zipcode','areacode','planname','room_suite','address','countyfips','latitude','longitude','phonenumber','designatedservice','npi','licensenumber_facilityoperatingcertificate','pfi','medicaidprovideridentificationnumber','commercialproviderindicator','medicaidproviderindicator','chpindicator','harpindicator','medicaidadvantageindicator','partialcapsindicator','mapindicator','paceindicator','fidaindicator','fidaiddindicator','hivsnpindicator','sip_plindicator','ep_indicator_basichealthprogramindicator','adultvision_dental_basichealthprogramadultindicator','commercialnon_mcomedicalindicator1','commercialnon_mcomedicalindicator2','commercialnon_mcomedicalindicator3','commercialnon_mcomedicalindicator4','commercialnon_mcomedicalindicator5','commercialnon_mcomedicalindicator6','commercialnon_mcomedicalindicator7','commercialnon_mcomedicalindicator8','service1','service2','service3','service4','service5','service6','service7','service8','service9','service10','service11','service12','service13','service14','service15','service16','service17','service18','service19','service20','service21','service22','service23','service24','service25','servicingcounty1','servicingcounty2','servicingcounty3','servicingcounty4','servicingcounty5','oasasprogramreportingunitnumber','oasasprovidernumber','omhid','providernetworkdatasystemidentificationnumber','quarter_year'],
  field_name='network_indicator_name',
  value_name='network_indicator_value'
) }} )

select distinct p.sitename,network_indicator_name from cte_unpivoted inner join {{ref('providers')}} p
on p.sitename = cte_unpivoted.sitename
where network_indicator_value = '1'
