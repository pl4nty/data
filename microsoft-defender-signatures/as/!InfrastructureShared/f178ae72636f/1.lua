-- Threat: !InfrastructureShared
-- Name: f178ae72636f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
