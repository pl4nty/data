-- Threat: !InfrastructureShared
-- Name: 5f783b952fda
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
