-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ccc_235.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() > 5013504 and (mp.getfilesize)() < 5046272 then
  return mp.INFECTED
end
return mp.CLEAN

