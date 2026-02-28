local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.integrity_level
L2_1 = MpCommon
L2_1 = L2_1.SECURITY_MANDATORY_HIGH_RID
if L1_1 > L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = {}
  L2_1["rpcnetp.exe"] = true
  L2_1["services.exe"] = true
  L2_1["svchost.exe"] = true
  L2_1["unity.exe"] = true
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = -30
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L4_1 = L3_1
  L3_1 = L3_1.match
  L5_1 = "\\system32\\([^\\]+%.exe)$"
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = L2_1[L3_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[6]
    L2_1 = L3_1.utf8p2
  end
end
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "UnistackSvcGroup"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = bm
L3_1 = L3_1.request_SMS
L4_1 = L0_1.ppid
L5_1 = "H"
L3_1(L4_1, L5_1)
L3_1 = bm
L3_1 = L3_1.add_action
L4_1 = "SmsAsyncScanEvent"
L5_1 = 5000
L3_1(L4_1, L5_1)
L3_1 = TrackPidAndTechniqueBM
L4_1 = L0_1.ppid
L5_1 = "T1036.004"
L6_1 = "masq_creates_nonstd_svchost"
L3_1(L4_1, L5_1, L6_1)
L3_1 = triggerMemQueryOnProcess
L4_1 = L0_1.ppid
L5_1 = "from:NonStdSvchostParent.A"
L6_1 = "masq_svchost_nonstd_parent"
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
if L4_1 ~= nil then
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.image_path
    if L10_1 ~= nil then
      L10_1 = L9_1.ppid
      if L10_1 ~= nil then
        L10_1 = bm
        L10_1 = L10_1.request_SMS
        L11_1 = L9_1.ppid
        L12_1 = "H"
        L10_1(L11_1, L12_1)
        L10_1 = bm
        L10_1 = L10_1.add_action
        L11_1 = "SmsAsyncScanEvent"
        L12_1 = 5000
        L10_1(L11_1, L12_1)
        L10_1 = TrackPidAndTechniqueBM
        L11_1 = L9_1.ppid
        L12_1 = "T1036.004"
        L13_1 = "masq_svchost_nonstd_parent:"
        L14_1 = L1_1
        L13_1 = L13_1 .. L14_1
        L10_1(L11_1, L12_1, L13_1)
        L10_1 = triggerMemQueryOnProcess
        L11_1 = L9_1.ppid
        L12_1 = "from:NonStdSvchostParent.A"
        L13_1 = "masq_svchost_nonstd_child"
        L10_1(L11_1, L12_1, L13_1)
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
