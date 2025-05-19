-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f1e_241.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 1597900 and (mp.getfilesize)() < 1598100 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

