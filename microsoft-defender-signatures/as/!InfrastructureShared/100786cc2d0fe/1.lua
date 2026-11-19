-- Threat: !InfrastructureShared
-- Name: 100786cc2d0fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
