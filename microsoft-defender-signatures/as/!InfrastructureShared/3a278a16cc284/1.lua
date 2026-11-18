-- Threat: !InfrastructureShared
-- Name: 3a278a16cc284
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security and mp.getfilesize() > 1200000 and mp.getfilesize() < 5500000 and pesecs[2].Name == ".rsrc" and pesecs[3].Name == ".reloc" then
  return mp.INFECTED
end
return mp.CLEAN
