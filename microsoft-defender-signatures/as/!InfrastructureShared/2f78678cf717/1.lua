-- Threat: !InfrastructureShared
-- Name: 2f78678cf717
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
