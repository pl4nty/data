-- Threat: !InfrastructureShared
-- Name: 3d78decc7399
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and pesecs[2].Name == ".rsrc" and pesecs[3].Name == ".reloc" and mp.getfilesize() > 500000 then
  return mp.INFECTED
end
return mp.CLEAN
