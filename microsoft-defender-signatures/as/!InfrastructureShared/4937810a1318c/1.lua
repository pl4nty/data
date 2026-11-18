-- Threat: !InfrastructureShared
-- Name: 4937810a1318c
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
