-- Threat: !InfrastructureShared
-- Name: f37849c5ca16
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
