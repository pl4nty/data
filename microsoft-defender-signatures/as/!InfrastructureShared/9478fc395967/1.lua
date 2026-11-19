-- Threat: !InfrastructureShared
-- Name: 9478fc395967
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
