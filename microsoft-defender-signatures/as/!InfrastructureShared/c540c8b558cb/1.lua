-- Threat: !InfrastructureShared
-- Name: c540c8b558cb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
