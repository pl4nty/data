-- Threat: !InfrastructureShared
-- Name: 8478a24a5ac5
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
