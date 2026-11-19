-- Threat: !InfrastructureShared
-- Name: 687835336d50
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
