-- Threat: !InfrastructureShared
-- Name: b5405f17b7a4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
