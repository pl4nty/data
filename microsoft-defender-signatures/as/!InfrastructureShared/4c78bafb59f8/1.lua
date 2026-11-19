-- Threat: !InfrastructureShared
-- Name: 4c78bafb59f8
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
