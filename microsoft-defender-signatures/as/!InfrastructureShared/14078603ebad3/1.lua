-- Threat: !InfrastructureShared
-- Name: 14078603ebad3
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
