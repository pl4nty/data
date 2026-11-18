-- Threat: !InfrastructureShared
-- Name: a5405c77c3d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
