-- Threat: !InfrastructureShared
-- Name: 9278271e6d0c
-- Type: 21

if not peattributes.ismsil then
  return mp.CLEAN
end
if mp.enum_mpattributesubstring("Lua:PeCompanyName!microsoft") ~= nil or mp.enum_mpattributesubstring("Lua:PeInternalName!microsoft.") ~= nil or mp.enum_mpattributesubstring("Lua:PeOriginalName!microsoft.") ~= nil or mp.get_mpattribute("Lua:Company_Microsoft") then
  return mp.CLEAN
end
return mp.INFECTED
