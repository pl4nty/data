-- Threat: !InfrastructureShared
-- Name: cc78122e0b55
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
