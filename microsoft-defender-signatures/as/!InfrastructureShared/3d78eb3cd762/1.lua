-- Threat: !InfrastructureShared
-- Name: 3d78eb3cd762
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
