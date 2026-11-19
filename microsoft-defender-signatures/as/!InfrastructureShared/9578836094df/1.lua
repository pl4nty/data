-- Threat: !InfrastructureShared
-- Name: 9578836094df
-- Type: 21

if mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
