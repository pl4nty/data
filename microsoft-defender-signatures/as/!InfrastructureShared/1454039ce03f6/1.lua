-- Threat: !InfrastructureShared
-- Name: 1454039ce03f6
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
