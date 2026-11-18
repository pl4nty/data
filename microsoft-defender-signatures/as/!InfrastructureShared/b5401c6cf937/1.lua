-- Threat: !InfrastructureShared
-- Name: b5401c6cf937
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
