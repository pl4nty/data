-- Threat: !InfrastructureShared
-- Name: 11c7810fe40e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
