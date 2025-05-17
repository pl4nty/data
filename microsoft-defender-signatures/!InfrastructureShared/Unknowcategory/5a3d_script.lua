-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5a3d_luac 

-- params : ...
-- function num : 0
if peattributes.isdll and (mp.getfilesize)() > 9000000 then
  return mp.INFECTED
end
return mp.CLEAN

