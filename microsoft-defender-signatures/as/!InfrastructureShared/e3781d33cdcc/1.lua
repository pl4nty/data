-- Threat: !InfrastructureShared
-- Name: e3781d33cdcc
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
