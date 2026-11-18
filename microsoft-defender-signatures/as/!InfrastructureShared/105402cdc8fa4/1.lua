-- Threat: !InfrastructureShared
-- Name: 105402cdc8fa4
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
