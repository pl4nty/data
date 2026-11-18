-- Threat: !InfrastructureShared
-- Name: bd7833d3a7bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
