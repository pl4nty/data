-- Threat: !InfrastructureShared
-- Name: 16578a7129fab
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
