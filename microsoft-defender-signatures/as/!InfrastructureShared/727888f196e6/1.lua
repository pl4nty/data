-- Threat: !InfrastructureShared
-- Name: 727888f196e6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
