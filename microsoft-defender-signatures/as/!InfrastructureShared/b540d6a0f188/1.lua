-- Threat: !InfrastructureShared
-- Name: b540d6a0f188
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
