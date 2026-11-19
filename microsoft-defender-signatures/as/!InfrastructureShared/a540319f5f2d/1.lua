-- Threat: !InfrastructureShared
-- Name: a540319f5f2d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
