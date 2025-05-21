-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5ef4_210.luac 

-- params : ...
-- function num : 0
if peattributes.no_security and (mp.getfilesize)() < 458752 then
  return mp.INFECTED
end
return mp.CLEAN

