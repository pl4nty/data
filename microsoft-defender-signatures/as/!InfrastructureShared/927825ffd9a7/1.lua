-- Threat: !InfrastructureShared
-- Name: 927825ffd9a7
-- Type: 21

if mp.getfilesize() < 100000 and pehdr.Machine == 34404 then
  return mp.INFECTED
end
return mp.CLEAN
