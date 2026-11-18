-- Threat: PUAAdvertising:Win32/360Browser
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & MIXED:PUA:360 & !BM_MZ_DLL

local l_0_0 = pe.get_versioninfo()
local l_0_1 = mp.getfilesize()
if l_0_0 == nil or l_0_1 < 10485760 then
  return mp.CLEAN
end
local l_0_2 = l_0_0.FileDescription
local l_0_3 = l_0_0.InternalName
if l_0_2 and l_0_3 then
  l_0_2 = string.lower(l_0_2)
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_2, "360\229\174\137\229\133\168\230\181\143\232\167\136\229\153\168", 1, true) and string.find(l_0_3, "mini_installer", 1, true) then
    mp.set_mpattribute("Lua:360Browser")
    return mp.INFECTED
  end
end
return mp.CLEAN
