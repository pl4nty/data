-- Threat: !InfrastructureShared
-- Name: 105403c504018
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
