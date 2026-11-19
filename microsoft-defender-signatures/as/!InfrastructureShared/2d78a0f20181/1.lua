-- Threat: !InfrastructureShared
-- Name: 2d78a0f20181
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
