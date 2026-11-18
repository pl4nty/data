-- Threat: !InfrastructureShared
-- Name: 1f78f11fd8c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
