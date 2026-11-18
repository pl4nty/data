-- Threat: !InfrastructureShared
-- Name: 95406a312cf1
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
