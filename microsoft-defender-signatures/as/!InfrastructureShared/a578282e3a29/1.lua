-- Threat: !InfrastructureShared
-- Name: a578282e3a29
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
