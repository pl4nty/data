-- Threat: !InfrastructureShared
-- Name: 667892e7ae4a
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
