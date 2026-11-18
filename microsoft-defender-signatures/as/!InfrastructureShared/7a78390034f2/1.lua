-- Threat: !InfrastructureShared
-- Name: 7a78390034f2
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
