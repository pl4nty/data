-- Threat: !InfrastructureShared
-- Name: 188b3192349fa
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) ~= nil or string.sub(l_0_1, -12) == "\\ksomisc.exe" then
    return mp.CLEAN
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_2 = this_sigattrlog[2].utf8p2
  if sysio.IsFileExists(l_0_2) then
    bm.add_related_file(l_0_2)
  end
end
return mp.INFECTED
