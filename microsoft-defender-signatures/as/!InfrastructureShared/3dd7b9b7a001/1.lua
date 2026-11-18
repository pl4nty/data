-- Threat: !InfrastructureShared
-- Name: 3dd7b9b7a001
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
if l_0_2 ~= "wmic.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  local l_0_5 = string.match(l_0_4, "\\([^\\]+)$")
  if l_0_5 == "picus.simulator.exe" then
    local l_0_6 = versioning.GetOrgID()
    if l_0_6 ~= nil and l_0_6 ~= "" then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
end
return mp.CLEAN
