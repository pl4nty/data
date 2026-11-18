-- Threat: !InfrastructureShared
-- Name: 1a978780faac2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
