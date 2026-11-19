-- Threat: !InfrastructureShared
-- Name: 34d78773c8d1
-- Type: 21
-- Includes: Path, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if StringEndsWith(l_0_1, "\\node.exe") and string.find(l_0_1, "\\windows\\system32\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
