-- Threat: !InfrastructureShared
-- Name: 82785759b3bc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
