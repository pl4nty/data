-- Threat: !InfrastructureShared
-- Name: 607855b42b0c
-- Type: 21

if pehdr.NumberOfSections >= 6 and (pesecs[6].Name == ".blluett" or pesecs[6].Name == ".vgcfck0") then
  return mp.INFECTED
end
return mp.CLEAN
