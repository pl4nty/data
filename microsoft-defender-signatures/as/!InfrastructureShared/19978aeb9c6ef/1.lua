-- Threat: !InfrastructureShared
-- Name: 19978aeb9c6ef
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
