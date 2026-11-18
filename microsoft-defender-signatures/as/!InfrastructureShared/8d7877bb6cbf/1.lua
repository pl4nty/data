-- Threat: !InfrastructureShared
-- Name: 8d7877bb6cbf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
