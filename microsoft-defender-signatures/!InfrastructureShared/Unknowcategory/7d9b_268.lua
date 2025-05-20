-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7d9b_268.luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and (mp.getfilesize)() > 1300000 and (mp.getfilesize)() < 3200000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

