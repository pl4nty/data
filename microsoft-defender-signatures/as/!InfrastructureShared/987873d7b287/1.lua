-- Threat: !InfrastructureShared
-- Name: 987873d7b287
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
