-- Threat: !InfrastructureShared
-- Name: 17540dbf6d85e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_exports == true then
  return mp.INFECTED
end
return mp.CLEAN
