-- Threat: !InfrastructureShared
-- Name: 27b78cd638f14
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
