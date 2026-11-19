-- Threat: !InfrastructureShared
-- Name: 2778586be2d2
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
