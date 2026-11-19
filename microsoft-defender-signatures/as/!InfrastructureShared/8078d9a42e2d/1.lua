-- Threat: !InfrastructureShared
-- Name: 8078d9a42e2d
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
