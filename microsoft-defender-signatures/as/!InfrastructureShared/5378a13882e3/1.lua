-- Threat: !InfrastructureShared
-- Name: 5378a13882e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
