-- Threat: !InfrastructureShared
-- Name: 7c2941e3610b
-- Type: 21

if mp.getfilesize() < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
