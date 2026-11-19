-- Threat: !InfrastructureShared
-- Name: 45403614d745
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
