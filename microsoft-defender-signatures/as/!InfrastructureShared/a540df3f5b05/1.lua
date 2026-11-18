-- Threat: !InfrastructureShared
-- Name: a540df3f5b05
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
