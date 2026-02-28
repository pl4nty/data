local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = pcallEx
L1_1 = "get_startup_info"
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 then
      goto lbl_17
    end
  end
end
L2_1 = ""
::lbl_17::

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = GetRollingQueueKeys
  L1_2 = "015b9d6d_"
  L2_2 = L2_1
  L1_2 = L1_2 .. L2_2
  L0_2 = L0_2(L1_2)
  if L0_2 ~= nil then
    L1_2 = type
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "table" then
      L1_2 = ipairs
      L2_2 = L0_2
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = bm
        L6_2 = L6_2.add_related_string
        L7_2 = "mace_015b9d6d"
        L8_2 = L5_2
        L9_2 = bm
        L9_2 = L9_2.RelatedStringBMReport
        L6_2(L7_2, L8_2, L9_2)
      end
    end
  end
end

function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = GetRollingQueueKeys
  L1_2 = "82e27b72_"
  L2_2 = L2_1
  L1_2 = L1_2 .. L2_2
  L0_2 = L0_2(L1_2)
  if L0_2 ~= nil then
    L1_2 = type
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "table" then
      L1_2 = ipairs
      L2_2 = L0_2
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = bm
        L6_2 = L6_2.add_related_string
        L7_2 = "mace_82e27b72"
        L8_2 = L5_2
        L9_2 = bm
        L9_2 = L9_2.RelatedStringBMReport
        L6_2(L7_2, L8_2, L9_2)
      end
    end
  end
end

function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = string
  L0_2 = L0_2.format
  L1_2 = "ScanBeaconing.A:%s"
  L2_2 = L2_1
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = MpCommon
  L1_2 = L1_2.AtomicCounterValue
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = bm
    L2_2 = L2_2.add_related_string
    L3_2 = "mace_7d0d767b"
    L4_2 = string
    L4_2 = L4_2.format
    L5_2 = "%d"
    L6_2 = L1_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = bm
    L5_2 = L5_2.RelatedStringBMReport
    L2_2(L3_2, L4_2, L5_2)
  end
end

L6_1 = pcallEx
L7_1 = "BlockC2Connection"
L8_1 = BlockC2Connection
L9_1 = "cobaltstrike_e"
L6_1(L7_1, L8_1, L9_1)
L6_1 = pcallEx
L7_1 = "maceSendConfig"
L8_1 = maceSendConfig
L9_1 = "mace_atosev"
L6_1(L7_1, L8_1, L9_1)
L6_1 = pcallEx
L7_1 = "reportRelatedBmHits"
L8_1 = reportRelatedBmHits
L6_1(L7_1, L8_1)
L6_1 = pcallEx
L7_1 = "triggerMemoryScanOnProcessTree"
L8_1 = triggerMemoryScanOnProcessTree
L9_1 = false
L10_1 = true
L11_1 = "SMS_H"
L12_1 = 5000
L13_1 = "Behavior:Win32/CobaltStrike.D!sms"
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = pcallEx
L7_1 = "addChildrenAsThreat"
L8_1 = addChildrenAsThreat
L6_1(L7_1, L8_1)
L6_1 = pcallEx
L7_1 = "reportPatch"
L8_1 = L4_1
L6_1(L7_1, L8_1)
L6_1 = pcallEx
L7_1 = "reportHosts"
L8_1 = L3_1
L6_1(L7_1, L8_1)
L6_1 = pcallEx
L7_1 = "reportBeaconing"
L8_1 = L5_1
L6_1(L7_1, L8_1)
L6_1 = reportPcallEx
L6_1()
L6_1 = reportRdTrace
L6_1()
L6_1 = pcall
L7_1 = reportBmInfo
L6_1, L7_1 = L6_1(L7_1)
if not L6_1 and L7_1 then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "bmInfoFailReason"
  L10_1 = tostring
  L11_1 = L7_1
  L10_1 = L10_1(L11_1)
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
