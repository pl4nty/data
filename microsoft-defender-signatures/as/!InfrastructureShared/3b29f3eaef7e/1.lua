-- Threat: !InfrastructureShared
-- Name: 3b29f3eaef7e
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
