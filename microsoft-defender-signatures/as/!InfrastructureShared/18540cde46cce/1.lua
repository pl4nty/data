-- Threat: !InfrastructureShared
-- Name: 18540cde46cce
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
