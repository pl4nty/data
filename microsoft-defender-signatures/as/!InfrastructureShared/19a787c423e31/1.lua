-- Threat: !InfrastructureShared
-- Name: 19a787c423e31
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
