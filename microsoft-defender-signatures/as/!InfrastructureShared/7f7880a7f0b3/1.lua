-- Threat: !InfrastructureShared
-- Name: 7f7880a7f0b3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
