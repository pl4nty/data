-- Threat: !InfrastructureShared
-- Name: 3d7864f83b30
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
