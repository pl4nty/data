-- Threat: !InfrastructureShared
-- Name: 1a540780f3d7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
