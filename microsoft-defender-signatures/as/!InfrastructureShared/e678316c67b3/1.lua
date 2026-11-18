-- Threat: !InfrastructureShared
-- Name: e678316c67b3
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
