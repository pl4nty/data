-- Threat: !InfrastructureShared
-- Name: 2d786668c948
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
