-- Threat: !InfrastructureShared
-- Name: 145405bc33574
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
