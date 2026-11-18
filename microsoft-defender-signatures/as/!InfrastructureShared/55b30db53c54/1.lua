-- Threat: !InfrastructureShared
-- Name: 55b30db53c54
-- Type: 21

local l_0_0 = this_sigattrlog[4].utf8p1
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if not l_0_1 or l_0_1.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if this_sigattrlog[1].matched and (l_0_0:find("__psscriptpolicytest_[^\\]*%.ps1") or l_0_0:find("[^%.]+%.[^%.]+%.ps1$")) then
  return mp.CLEAN
end
if l_0_0:find("\\amazon\\elasticbeanstalk\\", 1, true) then
  return mp.CLEAN
end
if not mp.IsKnownFriendlyFile(l_0_0, false, false) then
  local l_0_2 = string.match(l_0_0, "(%.[^%.]+)$")
  if not l_0_2 then
    return mp.INFECTED
  end
  local l_0_3 = {
    [".dat"] = true,
    [".pif"] = true,
    [".js"] = true,
    [".jse"] = true,
    [".ps1"] = true,
    [".vbs"] = true,
    [".vbe"] = true,
    [".hta"] = true,
    [".wsf"] = true,
    [".cmd"] = true,
    [".bat"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
