-- Threat: !InfrastructureShared
-- Name: 62788019490a
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
