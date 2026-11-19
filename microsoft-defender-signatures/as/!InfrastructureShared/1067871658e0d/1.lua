-- Threat: !InfrastructureShared
-- Name: 1067871658e0d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
