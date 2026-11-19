-- Threat: !InfrastructureShared
-- Name: 327894067911
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
