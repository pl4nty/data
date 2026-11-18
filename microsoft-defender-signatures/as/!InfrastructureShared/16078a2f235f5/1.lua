-- Threat: !InfrastructureShared
-- Name: 16078a2f235f5
-- Type: 21

if mp.getfilesize() < 2560000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
