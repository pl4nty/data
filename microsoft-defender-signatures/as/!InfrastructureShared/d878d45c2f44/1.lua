-- Threat: !InfrastructureShared
-- Name: d878d45c2f44
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
