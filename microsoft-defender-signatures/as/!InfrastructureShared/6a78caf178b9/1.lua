-- Threat: !InfrastructureShared
-- Name: 6a78caf178b9
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
