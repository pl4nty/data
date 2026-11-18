-- Threat: !InfrastructureShared
-- Name: d878f17aed3b
-- Type: 21

if mp.getfilesize() < 230000 then
  return mp.INFECTED
end
return mp.CLEAN
