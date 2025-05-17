-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\4b0f_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("MACRO_HSTR:OfficeAutoOpen") then
  return mp.INFECTED
end
return mp.LOWFI

