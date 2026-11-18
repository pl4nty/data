-- Threat: !InfrastructureShared
-- Name: 2540c8f95f4f
-- Type: 21

if mp.getfilesize() > 1500000 then
  return mp.CLEAN
end
return mp.INFECTED
