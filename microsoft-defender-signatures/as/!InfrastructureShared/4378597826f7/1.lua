-- Threat: !InfrastructureShared
-- Name: 4378597826f7
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
