-- Threat: !InfrastructureShared
-- Name: 9861f39cde8b
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections == 7 then
  return mp.INFECTED
end
return mp.CLEAN
