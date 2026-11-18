-- Threat: !InfrastructureShared
-- Name: d540d59e3f0e
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
