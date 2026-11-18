-- Threat: !InfrastructureShared
-- Name: b8784f420a86
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
