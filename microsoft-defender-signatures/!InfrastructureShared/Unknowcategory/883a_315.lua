-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\883a_315.luac 

-- params : ...
-- function num : 0
if peattributes.no_security and pehdr.NumberOfSections == 4 and (pesecs[3]).Name == ".data" and (pesecs[4]).Name == ".rsrc" then
  return mp.INFECTED
end
return mp.CLEAN

