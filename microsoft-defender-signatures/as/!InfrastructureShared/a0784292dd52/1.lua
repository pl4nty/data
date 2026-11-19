-- Threat: !InfrastructureShared
-- Name: a0784292dd52
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
