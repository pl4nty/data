-- Threat: !InfrastructureShared
-- Name: bc7850f0961e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
