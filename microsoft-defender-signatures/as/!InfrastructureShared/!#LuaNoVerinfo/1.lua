-- Threat: !InfrastructureShared
-- Name: !#Lua:NoVerinfo
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.INFECTED
end
local l_0_1 = l_0_0.CompanyName
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
  l_0_1 = l_0_1:gsub(" ", "__")
  mp.set_mpattribute("Lua:PeCompanyName!" .. l_0_1)
else
  mp.set_mpattribute("Lua:PeCompanyName!nil")
end
local l_0_2 = l_0_0.LegalCopyright
if l_0_2 then
  l_0_2 = string.lower(l_0_2)
  l_0_2 = l_0_2:gsub(" ", "__")
  mp.set_mpattribute("Lua:PeLegalCopyright!" .. l_0_2)
else
  mp.set_mpattribute("Lua:PeLegalCopyright!nil")
end
local l_0_3 = l_0_0.ProductName
if l_0_3 then
  l_0_3 = string.lower(l_0_3)
  l_0_3 = l_0_3:gsub(" ", "__")
  mp.set_mpattribute("Lua:PeProductName!" .. l_0_3)
else
  mp.set_mpattribute("Lua:PeProductName!nil")
end
return mp.CLEAN
