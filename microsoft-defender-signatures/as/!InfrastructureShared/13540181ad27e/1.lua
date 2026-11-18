-- Threat: !InfrastructureShared
-- Name: 13540181ad27e
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
