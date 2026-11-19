-- Threat: !InfrastructureShared
-- Name: 10d78ea2bf57b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
