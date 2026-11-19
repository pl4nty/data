-- Threat: !InfrastructureShared
-- Name: 3478098b51fe
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
