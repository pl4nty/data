-- Threat: !InfrastructureShared
-- Name: 44783a6843e7
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
