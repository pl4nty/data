-- Threat: !InfrastructureShared
-- Name: 4578f0bb8cc9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
