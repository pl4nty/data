-- Threat: !InfrastructureShared
-- Name: 115406192ef1b
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
