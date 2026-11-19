-- Threat: !InfrastructureShared
-- Name: 7178869d1b1c
-- Type: 21

if pesecs[5].Name == "!EPack" and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
