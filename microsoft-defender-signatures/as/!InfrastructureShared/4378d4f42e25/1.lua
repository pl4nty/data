-- Threat: !InfrastructureShared
-- Name: 4378d4f42e25
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
