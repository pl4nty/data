-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/Qakbot.SE
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE & (FILE_DEVICE_IS_MOUNTED | FILE_REMOVABLE_MEDIA | FILE_READ_ONLY_DEVICE | MpFileIsOnRemovableDrive)

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.Arguments or l_0_0.RelativePath or nil
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0.IconLocation or nil
if l_0_2 == nil or not contains(l_0_2, {
  "zipfldr.dll",
  "shell32.dll"
}) then
  return mp.CLEAN
end
if contains(l_0_1, {".js", ".cmd"}) and contains(l_0_1, "..\\..\\") then
  return mp.INFECTED
end
return mp.CLEAN
