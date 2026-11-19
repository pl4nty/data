-- Threat: !InfrastructureShared
-- Name: 4c787a209170
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
