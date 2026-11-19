-- Threat: !InfrastructureShared
-- Name: 8478c4587421
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
