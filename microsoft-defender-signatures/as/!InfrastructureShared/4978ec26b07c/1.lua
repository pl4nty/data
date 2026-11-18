-- Threat: !InfrastructureShared
-- Name: 4978ec26b07c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
