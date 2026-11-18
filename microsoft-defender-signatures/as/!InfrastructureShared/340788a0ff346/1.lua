-- Threat: !InfrastructureShared
-- Name: 340788a0ff346
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 400000 and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
