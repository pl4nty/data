-- Threat: !InfrastructureShared
-- Name: 3854005020158
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
