-- Threat: !InfrastructureShared
-- Name: 8f7852a40786
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
