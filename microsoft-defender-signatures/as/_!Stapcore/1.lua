-- Threat: \xec!Stapcore
-- Type: 10
-- Includes: checkProductNameVersionInfrastructure
-- MpAttributes: PUA:CERT:PCAppStore & (SIGATTR:AdwPCAppStoreNSIS | HSTR:AdwPCAppStoreNSIS)

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.INFECTED
end
local l_0_1 = l_0_0.CompanyName
local l_0_2 = l_0_0.ProductName
local l_0_3 = l_0_0.ProductVersion
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
else
  l_0_1 = ""
end
if l_0_2 then
  l_0_2 = string.lower(l_0_2)
else
  l_0_2 = ""
end
if l_0_3 then
  l_0_3 = string.lower(l_0_3)
else
  l_0_3 = ""
end
if l_0_1 ~= "fast corporation ltd" then
  return mp.INFECTED
end
if l_0_2 ~= "pc app store" then
  return mp.INFECTED
end
local l_0_4 = l_0_3:match("([0-9.]+)")
if l_0_4 == nil then
  return mp.INFECTED
end
if compareProductVersion(l_0_4, "1.0.0.1091") == -1 then
  return mp.INFECTED
end
return mp.CLEAN
