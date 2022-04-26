select ps.speciality, count(distinct pt.physician_id) from patient_treatment pt
join event_category ec on ec.event_name = pt.event_name
join physician_speciality ps on ps.physician_id = pt.physician_id
where ec.category = 'Procedure'
group by ps.speciality

for f in *.txt; do 
    mv -- "$f" "${f%.txt}.text"
done