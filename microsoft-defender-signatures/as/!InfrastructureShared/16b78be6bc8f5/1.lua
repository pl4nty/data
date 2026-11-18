-- Threat: !InfrastructureShared
-- Name: 16b78be6bc8f5
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
