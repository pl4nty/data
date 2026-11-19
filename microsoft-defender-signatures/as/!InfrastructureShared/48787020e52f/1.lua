-- Threat: !InfrastructureShared
-- Name: 48787020e52f
-- Type: 21

if mp.getfilesize() <= 113000 then
  return mp.INFECTED
end
return mp.CLEAN
