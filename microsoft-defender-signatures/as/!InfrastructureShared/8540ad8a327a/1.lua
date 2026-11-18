-- Threat: !InfrastructureShared
-- Name: 8540ad8a327a
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
