-- Threat: !InfrastructureShared
-- Name: 45781982b3a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
