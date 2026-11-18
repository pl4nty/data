-- Threat: !InfrastructureShared
-- Name: 33291a2a60a7
-- Type: 21

if mp.getfilesize() <= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
