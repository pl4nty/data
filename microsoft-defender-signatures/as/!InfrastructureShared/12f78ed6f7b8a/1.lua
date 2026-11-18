-- Threat: !InfrastructureShared
-- Name: 12f78ed6f7b8a
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
