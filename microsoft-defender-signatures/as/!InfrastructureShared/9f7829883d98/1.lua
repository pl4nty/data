-- Threat: !InfrastructureShared
-- Name: 9f7829883d98
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
