-- Threat: !InfrastructureShared
-- Name: 24a78b65bc93c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
