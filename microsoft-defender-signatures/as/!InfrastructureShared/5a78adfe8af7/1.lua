-- Threat: !InfrastructureShared
-- Name: 5a78adfe8af7
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
