-- Threat: !InfrastructureShared
-- Name: 607858aa8a84
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
