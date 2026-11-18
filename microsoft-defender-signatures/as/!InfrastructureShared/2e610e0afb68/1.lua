-- Threat: !InfrastructureShared
-- Name: 2e610e0afb68
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
