-- Threat: !InfrastructureShared
-- Name: b17888f16972
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
