-- Threat: !InfrastructureShared
-- Name: 57780fbbeff3
-- Type: 21

if peattributes.isdll and peattributes.no_security == false and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
