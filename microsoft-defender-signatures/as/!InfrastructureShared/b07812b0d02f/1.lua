-- Threat: !InfrastructureShared
-- Name: b07812b0d02f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
