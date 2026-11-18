-- Threat: !InfrastructureShared
-- Name: 9f7870b07877
-- Type: 21

if peattributes.no_security and peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
