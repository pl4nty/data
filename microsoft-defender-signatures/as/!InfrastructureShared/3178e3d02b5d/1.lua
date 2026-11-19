-- Threat: !InfrastructureShared
-- Name: 3178e3d02b5d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 11000 then
  return mp.INFECTED
end
return mp.CLEAN
