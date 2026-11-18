-- Threat: !InfrastructureShared
-- Name: 437856e9538e
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
