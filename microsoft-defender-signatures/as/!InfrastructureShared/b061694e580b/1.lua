-- Threat: !InfrastructureShared
-- Name: b061694e580b
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
