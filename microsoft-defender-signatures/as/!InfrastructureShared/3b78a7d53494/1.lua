-- Threat: !InfrastructureShared
-- Name: 3b78a7d53494
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
