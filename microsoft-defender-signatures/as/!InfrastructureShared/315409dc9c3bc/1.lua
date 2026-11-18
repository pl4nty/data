-- Threat: !InfrastructureShared
-- Name: 315409dc9c3bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
