-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a1df_450.luac 

-- params : ...
-- function num : 0
if not peattributes.ismsil then
  return mp.CLEAN
end
if (mp.enum_mpattributesubstring)("Lua:PeCompanyName!microsoft") ~= nil or (mp.enum_mpattributesubstring)("Lua:PeInternalName!microsoft.") ~= nil or (mp.enum_mpattributesubstring)("Lua:PeOriginalName!microsoft.") ~= nil or (mp.get_mpattribute)("Lua:Company_Microsoft") then
  return mp.CLEAN
end
return mp.INFECTED

