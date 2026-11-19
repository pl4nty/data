-- Threat: !InfrastructureShared
-- Name: b978083b5b39
-- Type: 21

if mp.get_mpattribute("pea_isexe") and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
