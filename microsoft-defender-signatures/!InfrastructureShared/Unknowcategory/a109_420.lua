-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a109_420.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 0 and epcode[1] == 131 and epcode[2] == 60 and epcode[5] == 119 and epcode[6] == 254 and ((pesecs[pehdr.NumberOfSections]).Name == ".reloc" or (pesecs[pehdr.NumberOfSections]).Name == ".rsrc") then
  return mp.INFECTED
end
return mp.CLEAN

