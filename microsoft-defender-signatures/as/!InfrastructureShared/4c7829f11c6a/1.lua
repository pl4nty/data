-- Threat: !InfrastructureShared
-- Name: 4c7829f11c6a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
