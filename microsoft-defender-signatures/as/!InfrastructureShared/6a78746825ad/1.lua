-- Threat: !InfrastructureShared
-- Name: 6a78746825ad
-- Type: 21

if mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
