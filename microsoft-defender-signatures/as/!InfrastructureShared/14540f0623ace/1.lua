-- Threat: !InfrastructureShared
-- Name: 14540f0623ace
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
