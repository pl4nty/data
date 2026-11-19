-- Threat: !InfrastructureShared
-- Name: 5d784c3d3be8
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
