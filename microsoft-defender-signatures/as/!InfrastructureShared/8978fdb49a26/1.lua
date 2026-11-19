-- Threat: !InfrastructureShared
-- Name: 8978fdb49a26
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
