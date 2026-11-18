-- Threat: !InfrastructureShared
-- Name: 4d7890d06a03
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
