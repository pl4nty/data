-- Threat: !InfrastructureShared
-- Name: e5d7ee0f5e32
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if isnull(l_0_1) or isnull(l_0_1.image_path) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if StringEndsWith(l_0_2, "\\svchost.exe") or StringEndsWith(l_0_2, "\\wscript.exe") then
  return mp.CLEAN
end
return mp.INFECTED
