-- Threat: !InfrastructureShared
-- Name: !#SLF:RenamedRclone.SB
-- Type: 10
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile

if not mp.get_mpattribute("Lua:PeOriginalName!rclone.exe") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if l_0_0 == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
local l_0_1 = {
  "\\program files",
  "\\rclone.exe",
  "\\cmmagent.exe",
  "\\gclone.exe",
  "\\lclone.exe",
  "\\fclone.exe",
  "\\cbdownloader.exe",
  "rclone"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
else
  return mp.INFECTED
end
return mp.CLEAN
