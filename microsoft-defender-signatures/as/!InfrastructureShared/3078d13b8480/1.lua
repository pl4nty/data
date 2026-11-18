-- Threat: !InfrastructureShared
-- Name: 3078d13b8480
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
