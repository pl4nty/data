-- Threat: !InfrastructureShared
-- Name: 6e7876f4fc58
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
