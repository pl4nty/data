-- Threat: !InfrastructureShared
-- Name: b678c5fb6041
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
