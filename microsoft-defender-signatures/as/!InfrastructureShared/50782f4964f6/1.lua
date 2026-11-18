-- Threat: !InfrastructureShared
-- Name: 50782f4964f6
-- Type: 21

if mp.getfilesize() < 700000 then
  return mp.INFECTED
end
return mp.CLEAN
