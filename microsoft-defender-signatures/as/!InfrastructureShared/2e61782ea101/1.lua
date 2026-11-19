-- Threat: !InfrastructureShared
-- Name: 2e61782ea101
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
