-- Threat: !InfrastructureShared
-- Name: 14c7878d00a38
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
