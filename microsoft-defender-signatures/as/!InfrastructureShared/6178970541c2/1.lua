-- Threat: !InfrastructureShared
-- Name: 6178970541c2
-- Type: 21

if mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
