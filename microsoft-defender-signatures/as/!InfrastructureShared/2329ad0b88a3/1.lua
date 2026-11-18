-- Threat: !InfrastructureShared
-- Name: 2329ad0b88a3
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
