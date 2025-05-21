-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6c65_235.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() < 4000000 and (mp.getfilesize)() > 2000000 then
  return mp.INFECTED
end
return mp.CLEAN

