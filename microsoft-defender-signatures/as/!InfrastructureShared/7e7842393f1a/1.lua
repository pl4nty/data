-- Threat: !InfrastructureShared
-- Name: 7e7842393f1a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
