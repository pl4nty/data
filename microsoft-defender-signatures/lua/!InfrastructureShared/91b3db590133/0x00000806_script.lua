-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\91b3db590133\0x00000806_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if MpCommon.SECURITY_MANDATORY_HIGH_RID < l_0_0.integrity_level then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
do
  if l_0_1 ~= nil then
    local l_0_2 = {}
    l_0_2["rpcnetp.exe"] = true
    l_0_2["services.exe"] = true
    l_0_2["svchost.exe"] = true
    l_0_2["unity.exe"] = true
    if l_0_2[((string.lower)((string.sub)(l_0_1, -30))):match("\\system32\\([^\\]+%.exe)$")] then
      return mp.CLEAN
    end
  end
  local l_0_3 = nil
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
    l_0_3 = (this_sigattrlog[6]).utf8p2
  end
  if l_0_3 ~= nil and (string.find)(l_0_3, "UnistackSvcGroup", 1, true) then
    return mp.CLEAN
  end
  ;
  (bm.request_SMS)(l_0_0.ppid, "H")
  ;
  (bm.add_action)("SmsAsyncScanEvent", 5000)
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1036.004", "masq_creates_nonstd_svchost")
  triggerMemQueryOnProcess(l_0_0.ppid, "from:NonStdSvchostParent.A", "masq_svchost_nonstd_parent")
  local l_0_4, l_0_5 = (bm.get_process_relationships)()
  if l_0_5 ~= nil then
    for l_0_9,l_0_10 in ipairs(l_0_5) do
      if l_0_10.image_path ~= nil and l_0_10.ppid ~= nil then
        (bm.request_SMS)(l_0_10.ppid, "H")
        ;
        (bm.add_action)("SmsAsyncScanEvent", 5000)
        TrackPidAndTechniqueBM(l_0_10.ppid, "T1036.004", "masq_svchost_nonstd_parent:" .. l_0_1)
        triggerMemQueryOnProcess(l_0_10.ppid, "from:NonStdSvchostParent.A", "masq_svchost_nonstd_child")
      end
    end
  end
  do
    return mp.INFECTED
  end
end

