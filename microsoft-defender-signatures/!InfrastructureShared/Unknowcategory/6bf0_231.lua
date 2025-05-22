-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6bf0_231.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("pea_isexe") and pehdr.NumberOfSections == 8 then
  return mp.INFECTED
end
return mp.CLEAN

