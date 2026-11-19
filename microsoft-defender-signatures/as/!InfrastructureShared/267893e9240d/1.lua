-- Threat: !InfrastructureShared
-- Name: 267893e9240d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
