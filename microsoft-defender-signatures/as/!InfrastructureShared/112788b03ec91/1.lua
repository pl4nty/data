-- Threat: !InfrastructureShared
-- Name: 112788b03ec91
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
