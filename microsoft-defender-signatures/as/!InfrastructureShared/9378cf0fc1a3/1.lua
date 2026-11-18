-- Threat: !InfrastructureShared
-- Name: 9378cf0fc1a3
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
