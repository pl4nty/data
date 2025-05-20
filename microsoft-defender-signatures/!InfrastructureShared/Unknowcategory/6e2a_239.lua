-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6e2a_239.luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and peattributes.isexe == true and (mp.getfilesize)() > 3000000 then
  return mp.INFECTED
end
return mp.CLEAN

