-- Threat: !InfrastructureShared
-- Name: 51d7d3be979a
-- Type: 21

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
if l_0_2 ~= "ipconfig.exe" and l_0_2 ~= "netsh.exe" and l_0_2 ~= "route.exe" then
  return mp.CLEAN
end
if string.find(l_0_1, "\\windows\\system32\\", 1, true) ~= nil or string.find(l_0_1, "\\windows\\syswow64\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  local l_0_5 = string.match(l_0_4, "\\([^\\]+)$")
  if l_0_5 == "iediagcmd.exe" then
    local l_0_6 = versioning.GetOrgID()
    if l_0_6 == nil or l_0_6 == "" then
      return mp.CLEAN
    end
    l_0_6 = string.lower(l_0_6)
    if l_0_6 == "64eacc49-6a31-42c6-9b39-c3d9148e65f4" or l_0_6 == "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
      return mp.INFECTED
    end
    if l_0_6 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and versioning.IsSampled(10, false, true, true) == true then
      return mp.LOWFI
    end
  end
end
return mp.CLEAN
