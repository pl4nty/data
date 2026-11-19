-- Threat: !InfrastructureShared
-- Name: b27844656356
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
