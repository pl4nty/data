-- Threat: !InfrastructureShared
-- Name: 67783622997e
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
