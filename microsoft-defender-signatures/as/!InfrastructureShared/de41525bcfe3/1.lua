-- Threat: !InfrastructureShared
-- Name: de41525bcfe3
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
