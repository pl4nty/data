-- Threat: !InfrastructureShared
-- Name: 6f787137a18a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
