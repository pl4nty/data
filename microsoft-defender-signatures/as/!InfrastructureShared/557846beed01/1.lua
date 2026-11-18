-- Threat: !InfrastructureShared
-- Name: 557846beed01
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
