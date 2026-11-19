-- Threat: !InfrastructureShared
-- Name: 7178650dd034
-- Type: 21

if peattributes.isdll and peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
