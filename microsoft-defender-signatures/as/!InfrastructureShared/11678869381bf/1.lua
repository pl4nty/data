-- Threat: !InfrastructureShared
-- Name: 11678869381bf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
