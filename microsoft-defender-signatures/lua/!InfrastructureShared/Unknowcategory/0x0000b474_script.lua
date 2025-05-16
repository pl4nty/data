-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000b474_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 13 and (mp.getfilesize)() >= 5200000 and (mp.getfilesize)() <= 5850000 and (pesecs[8]).Name == ".idata" and (pesecs[9]).Name == ".tls" and (pesecs[13]).Name == ".reloc" then
  return mp.INFECTED
end
return mp.CLEAN

