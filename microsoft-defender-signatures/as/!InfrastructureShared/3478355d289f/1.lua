-- Threat: !InfrastructureShared
-- Name: 3478355d289f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
