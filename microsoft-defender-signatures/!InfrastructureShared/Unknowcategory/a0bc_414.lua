-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a0bc_414.luac 

-- params : ...
-- function num : 0
if epcode[1] == 72 and epcode[2] == 137 and peattributes.isexe == true and pehdr.AddressOfEntryPoint == 314640 and (pesecs[6]).Name == ".reloc" and (pesecs[6]).Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN

