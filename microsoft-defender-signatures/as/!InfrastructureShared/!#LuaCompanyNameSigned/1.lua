-- Threat: !InfrastructureShared
-- Name: !#Lua:CompanyNameSigned
-- Type: 10
-- MpAttributes: PEPCODE:HasDigitalSignature

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.CompanyName
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  ["microsoft corporation"] = "Lua:Company_Microsoft"
}
if l_0_2[l_0_1] ~= nil then
  mp.set_mpattribute(l_0_2[l_0_1])
end
return mp.CLEAN
