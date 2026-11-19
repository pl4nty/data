-- Threat: !InfrastructureShared
-- Name: 3a786551557d
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
