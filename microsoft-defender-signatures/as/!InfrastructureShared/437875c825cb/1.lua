-- Threat: !InfrastructureShared
-- Name: 437875c825cb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
