-- Threat: !InfrastructureShared
-- Name: 13a78afe134c1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
