-- Threat: !InfrastructureShared
-- Name: 91b3db590133
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil then
  local l_0_2 = {
    ["rpcnetp.exe"] = true,
    ["services.exe"] = true,
    ["svchost.exe"] = true,
    ["unity.exe"] = true
  }
  local l_0_3 = string.lower(string.sub(l_0_1, -30)):match("\\system32\\([^\\]+%.exe)$")
  if l_0_2[l_0_3] then
    return mp.CLEAN
  end
end
local l_0_4
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[6].utf8p2
end
if l_0_4 ~= nil and string.find(l_0_4, "UnistackSvcGroup", 1, true) then
  return mp.CLEAN
end
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 5000)
TrackPidAndTechniqueBM(l_0_0.ppid, "T1036.004", "masq_creates_nonstd_svchost")
triggerMemQueryOnProcess(l_0_0.ppid, "from:NonStdSvchostParent.A", "masq_svchost_nonstd_parent")
local l_0_5, l_0_6 = bm.get_process_relationships()
if l_0_6 ~= nil then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if l_0_8.image_path ~= nil and l_0_8.ppid ~= nil then
      bm.request_SMS(l_0_8.ppid, "H")
      bm.add_action("SmsAsyncScanEvent", 5000)
      TrackPidAndTechniqueBM(l_0_8.ppid, "T1036.004", "masq_svchost_nonstd_parent:" .. l_0_1)
      triggerMemQueryOnProcess(l_0_8.ppid, "from:NonStdSvchostParent.A", "masq_svchost_nonstd_child")
    end
  end
end
return mp.INFECTED
