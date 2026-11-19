-- Threat: !InfrastructureShared
-- Name: 7778838c2fd6
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
