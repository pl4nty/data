-- Threat: !InfrastructureShared
-- Name: b6290572c173
-- Type: 21

if mp.getfilesize() < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
