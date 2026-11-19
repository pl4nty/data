-- Threat: !InfrastructureShared
-- Name: 2978ff816a3b
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
