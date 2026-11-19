-- Threat: !InfrastructureShared
-- Name: !#TEL:NSISWithFileZillaCertDeepEmu
-- Type: 8
-- MpAttributes: MIXED:PUA:FileZillaEmu

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 4 or pesecs[4].Name ~= ".ndata" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
local l_0_2 = l_0_0.CompanyName
if l_0_1 and l_0_2 then
  l_0_1 = string.lower(l_0_1)
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "tim kosse", 1, true) and string.find(l_0_1, "filezilla ftp client", 1, true) then
    pe.set_peattribute("deep_analysis", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
