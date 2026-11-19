-- Threat: !InfrastructureShared
-- Name: 99612fff3be1
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
