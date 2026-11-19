-- Threat: !InfrastructureShared
-- Name: 45d75c968a4e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if l_0_2 ~= "mofcomp.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 and string.find(string.lower(l_0_3.image_path), "python", 1, true) and IsProcNameInParentProcessTree("cmdhstr", "ai_exec_server.exe") then
  local l_0_4 = versioning.GetOrgID()
  if l_0_4 ~= nil and l_0_4 ~= "" then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
