-- Threat: !InfrastructureShared
-- Name: 11540d00025fa
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
