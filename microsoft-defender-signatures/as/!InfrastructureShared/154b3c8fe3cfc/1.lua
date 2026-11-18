-- Threat: !InfrastructureShared
-- Name: 154b3c8fe3cfc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "\\([^\\]+)$")
if l_0_1 ~= "python.exe" and l_0_1 ~= "ai_exec_server.exe" and l_0_1 ~= "airuncommandasuser.exe" then
  return mp.CLEAN
end
if l_0_1 == "python.exe" and not IsProcNameInParentProcessTree("BM", "ai_exec_server.exe") and not IsProcNameInParentProcessTree("BM", "airuncommandasuser.exe") then
  return mp.CLEAN
end
return mp.INFECTED
