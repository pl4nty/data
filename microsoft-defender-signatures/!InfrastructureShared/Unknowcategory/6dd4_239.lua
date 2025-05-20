-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6dd4_239.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.no_security == true and (mp.getfilesize)() < 184322 then
  return mp.INFECTED
end
return mp.CLEAN

