-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5b74_207.luac 

-- params : ...
-- function num : 0
if peattributes.ismsil == true and (mp.getfilesize)() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN

