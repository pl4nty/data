-- Threat: !InfrastructureShared
-- Name: 25614e814bd0
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
