-- Threat: !InfrastructureShared
-- Name: 5f785ba04087
-- Type: 21

if mp.getfilesize() < 3149823 then
  return mp.INFECTED
end
return mp.CLEAN
