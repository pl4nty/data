-- Threat: !InfrastructureShared
-- Name: 15540040c9f58
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
