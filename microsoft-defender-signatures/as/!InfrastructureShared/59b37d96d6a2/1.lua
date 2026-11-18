-- Threat: !InfrastructureShared
-- Name: 59b37d96d6a2
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil then
  local l_0_2 = {
    ["rpcnetp.exe"] = true,
    ["services.exe"] = true,
    ["svchost.exe"] = true
  }
  local l_0_3 = string.lower(string.sub(l_0_1, -30)):match("\\system32\\([^\\]+%.exe)$")
  if l_0_2[l_0_3] then
    return mp.CLEAN
  end
end
local l_0_4
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[2].utf8p2
end
if l_0_4 ~= nil and string.find(l_0_4, "UnistackSvcGroup", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
