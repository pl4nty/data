-- Threat: !InfrastructureShared
-- Name: 1e578befb2841
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
