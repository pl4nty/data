-- Threat: !InfrastructureShared
-- Name: ca612a902100
-- Type: 21

if mp.get_mpattribute("pea_isdll") and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
