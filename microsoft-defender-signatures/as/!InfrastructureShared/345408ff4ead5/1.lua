-- Threat: !InfrastructureShared
-- Name: 345408ff4ead5
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
