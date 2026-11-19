-- Threat: !InfrastructureShared
-- Name: 83789fae37b1
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
