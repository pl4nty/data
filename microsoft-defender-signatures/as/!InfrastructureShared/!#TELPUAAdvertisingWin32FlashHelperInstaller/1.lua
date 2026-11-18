-- Threat: !InfrastructureShared
-- Name: !#TEL:PUAAdvertising:Win32/FlashHelperInstaller
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & MIXED:PUA:FlashHelperInstaller & !BM_MZ_DLL

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
local l_0_2 = l_0_0.CompanyName
if l_0_1 and l_0_2 then
  l_0_1 = string.lower(l_0_1)
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "adobe inc", 1, true) and string.find(l_0_1, "adobe download manager", 1, true) then
    mp.set_mpattribute("Lua:FlashHelperInstaller")
    return mp.INFECTED
  end
end
return mp.CLEAN
