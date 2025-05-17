-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6c02_luac 

-- params : ...
-- function num : 0
if peattributes.ismsil == true and peattributes.isexe == true and (mp.getfilesize)() < 8000 then
  return mp.INFECTED
end
return mp.CLEAN

