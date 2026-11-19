-- Threat: !InfrastructureShared
-- Name: 3978a47fd42e
-- Type: 21

if mp.getfilesize() < 393216 then
  return mp.INFECTED
end
return mp.CLEAN
