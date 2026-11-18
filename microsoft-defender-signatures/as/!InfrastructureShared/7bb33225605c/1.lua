-- Threat: !InfrastructureShared
-- Name: 7bb33225605c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil then
  local l_0_2 = {
    ["cmstp.exe"] = true,
    ["dllhost.exe"] = true
  }
  local l_0_3 = string.lower(string.sub(l_0_1, -15)):match("\\([^\\]+)$")
  if l_0_2[l_0_3] then
    return mp.CLEAN
  end
end
bm.add_related_file(l_0_1)
return mp.INFECTED
