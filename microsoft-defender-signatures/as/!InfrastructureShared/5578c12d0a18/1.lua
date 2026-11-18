-- Threat: !InfrastructureShared
-- Name: 5578c12d0a18
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
