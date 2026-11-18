-- Threat: !InfrastructureShared
-- Name: 8978fdb8f640
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
