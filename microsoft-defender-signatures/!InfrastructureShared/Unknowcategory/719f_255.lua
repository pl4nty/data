-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\719f_255.luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and (pesecs[3]).Name == ".ACE0" and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

