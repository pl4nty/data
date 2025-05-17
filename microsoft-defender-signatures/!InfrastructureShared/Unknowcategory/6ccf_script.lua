-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ccf_luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() > 23000000 and (mp.getfilesize)() < 24000000 then
  return mp.INFECTED
end
return mp.CLEAN

