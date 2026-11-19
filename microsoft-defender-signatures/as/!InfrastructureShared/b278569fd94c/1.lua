-- Threat: !InfrastructureShared
-- Name: b278569fd94c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
