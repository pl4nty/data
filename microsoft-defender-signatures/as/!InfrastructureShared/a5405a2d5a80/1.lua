-- Threat: !InfrastructureShared
-- Name: a5405a2d5a80
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
