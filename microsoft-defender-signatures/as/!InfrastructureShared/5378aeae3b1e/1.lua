-- Threat: !InfrastructureShared
-- Name: 5378aeae3b1e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
