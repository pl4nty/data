-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7d64_luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and (mp.getfilesize)() > 410000 and (mp.getfilesize)() < 920000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

