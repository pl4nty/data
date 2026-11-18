-- Threat: !InfrastructureShared
-- Name: 15b364e82951
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, true) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_3) do
  local l_0_6 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_5.ppid)
  if l_0_5.reason == bm.RELATIONSHIP_INJECTION and l_0_6.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID and string.find(string.lower(l_0_5.image_path), "\\windows\\", 1, true) then
    local l_0_7 = string.lower(bm.get_imagepath())
    if string.find(string.lower(l_0_7), "\\program files\\", 1, true) or string.find(string.lower(l_0_7), "\\program files (x86)\\", 1, true) or string.find(string.lower(l_0_7), "\\steamapps\\common\\", 1, true) or string.find(string.lower(l_0_7), "\\games\\", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
