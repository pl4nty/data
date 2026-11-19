-- Threat: !InfrastructureShared
-- Name: 1a77860b44fbd
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
