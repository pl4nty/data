-- Threat: !InfrastructureShared
-- Name: 37788591ad78
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
