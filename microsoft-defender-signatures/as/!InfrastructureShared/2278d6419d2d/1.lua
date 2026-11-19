-- Threat: !InfrastructureShared
-- Name: 2278d6419d2d
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
