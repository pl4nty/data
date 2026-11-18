-- Threat: !InfrastructureShared
-- Name: 9078161aea9f
-- Type: 21

if mp.get_mpattribute("pea_isdll") and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
