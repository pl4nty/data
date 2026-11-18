-- Threat: !InfrastructureShared
-- Name: ae41f445b646
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
