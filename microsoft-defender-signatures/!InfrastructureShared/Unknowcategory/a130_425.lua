-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a130_425.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.hasexports == true and (pesecs[3]).Name == "hydrated" and (pesecs[2]).Name == ".managed" and (pesecs[3]).Characteristics == 3221225600 and (mp.getfilesize)() >= 6000000 and (mp.getfilesize)() <= 8000000 then
  return mp.INFECTED
end
return mp.CLEAN

