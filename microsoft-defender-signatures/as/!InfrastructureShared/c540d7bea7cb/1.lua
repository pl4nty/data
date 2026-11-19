-- Threat: !InfrastructureShared
-- Name: c540d7bea7cb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
