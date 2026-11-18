-- Threat: !InfrastructureShared
-- Name: f178c32e0dd4
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
