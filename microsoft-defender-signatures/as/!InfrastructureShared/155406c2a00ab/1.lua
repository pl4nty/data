-- Threat: !InfrastructureShared
-- Name: 155406c2a00ab
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
