-- Threat: !InfrastructureShared
-- Name: 2540b8bf5047
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
