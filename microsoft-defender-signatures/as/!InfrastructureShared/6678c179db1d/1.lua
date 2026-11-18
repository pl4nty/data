-- Threat: !InfrastructureShared
-- Name: 6678c179db1d
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
