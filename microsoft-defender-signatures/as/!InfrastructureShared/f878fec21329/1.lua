-- Threat: !InfrastructureShared
-- Name: f878fec21329
-- Type: 21

if mp.getfilesize() < 34600 then
  return mp.INFECTED
end
return mp.CLEAN
