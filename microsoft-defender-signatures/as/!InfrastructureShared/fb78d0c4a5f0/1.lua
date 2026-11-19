-- Threat: !InfrastructureShared
-- Name: fb78d0c4a5f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
