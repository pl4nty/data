-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a386_516.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and epcode[1] == 104 and epcode[2] == 15 and peattributes.hasexports == true and pehdr.AddressOfEntryPoint == 12647710 and (pesecs[4]).Name == ".data020" and (pesecs[5]).Name == ".data021" and (mp.getfilesize)() >= 6000000 and (mp.getfilesize)() <= 7000000 then
  return mp.INFECTED
end
return mp.CLEAN

