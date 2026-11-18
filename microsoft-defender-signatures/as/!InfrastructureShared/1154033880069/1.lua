-- Threat: !InfrastructureShared
-- Name: 1154033880069
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
