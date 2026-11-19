-- Threat: !InfrastructureShared
-- Name: 8978244293c5
-- Type: 21

if mp.get_mpattribute("pea_isdll") and pehdr.NumberOfSections == 5 and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
