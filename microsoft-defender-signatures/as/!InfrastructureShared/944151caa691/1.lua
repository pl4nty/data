-- Threat: !InfrastructureShared
-- Name: 944151caa691
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
