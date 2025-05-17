-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6bf2_luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.ismsil == true and (mp.getfilesize)() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN

