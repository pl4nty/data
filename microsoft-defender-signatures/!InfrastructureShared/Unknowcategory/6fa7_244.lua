-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6fa7_244.luac 

-- params : ...
-- function num : 0
if peattributes.isvbnative == true and peattributes.no_security == true and (mp.getfilesize)() < 983040 then
  return mp.INFECTED
end
return mp.CLEAN

