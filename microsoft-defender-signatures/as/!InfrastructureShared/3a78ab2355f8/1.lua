-- Threat: !InfrastructureShared
-- Name: 3a78ab2355f8
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
