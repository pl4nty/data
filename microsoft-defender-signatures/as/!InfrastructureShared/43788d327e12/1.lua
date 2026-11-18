-- Threat: !InfrastructureShared
-- Name: 43788d327e12
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
