-- Threat: !InfrastructureShared
-- Name: 557820b00f4e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
