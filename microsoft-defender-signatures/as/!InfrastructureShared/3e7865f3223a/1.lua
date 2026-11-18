-- Threat: !InfrastructureShared
-- Name: 3e7865f3223a
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
