-- Threat: !InfrastructureShared
-- Name: 28780b18cf58
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
