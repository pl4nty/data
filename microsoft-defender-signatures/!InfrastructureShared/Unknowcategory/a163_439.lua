-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a163_439.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and pehdr.AddressOfEntryPoint == 5088 and (pesecs[7]).Name == ".idata" and (pesecs[7]).Characteristics == 3221225536 and (pesecs[9]).Name == ".tls" and (pesecs[9]).Characteristics == 3221225536 and (mp.getfilesize)() <= 500000 then
  return mp.INFECTED
end
return mp.CLEAN

