-- Threat: !InfrastructureShared
-- Name: 3478a9eac571
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
