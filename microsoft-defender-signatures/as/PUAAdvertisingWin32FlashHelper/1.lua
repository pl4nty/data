-- Threat: PUAAdvertising:Win32/FlashHelper
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & MIXED:PUA:FlashHelper & !BM_MZ_DLL

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
local l_0_2 = l_0_0.InternalName
if l_0_1 and l_0_2 then
  l_0_1 = string.lower(l_0_1)
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "flashhelperservices.exe", 1, true) and string.find(l_0_1, "flash helper service", 1, true) then
    mp.set_mpattribute("Lua:FlashHelperService")
    return mp.INFECTED
  end
end
return mp.CLEAN
