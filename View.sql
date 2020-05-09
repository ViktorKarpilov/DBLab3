
create view incedent_standart as
select
    country,state,city,street,starttime,endtime,distance,side,severity_severity as severity,incedent_sourcev1.source_source as source
from 

state
inner join country
on state.country_country=country.country
inner join city
on city.state_state = state.state
inner join street
on street.city_city = city.city
inner join incedent
on incedent.street_street = street.street
inner join side
on incedent.side_side = side.side
inner join incedent_sourcev1
on incedent.incedent_id = incedent_sourcev1.incedent_incedent_id
;

create view incedent_simple as
select
    country,state,city,street,starttime,endtime,distance,side,severity_severity as severity
from 

state
inner join country
on state.country_country=country.country
inner join city
on city.state_state = state.state
inner join street
on street.city_city = city.city
inner join incedent
on incedent.street_street = street.street
inner join side
on incedent.side_side = side.side
;