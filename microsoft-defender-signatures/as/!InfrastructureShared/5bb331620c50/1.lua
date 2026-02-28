local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.ENGINEBUILD
if L0_1 < 24070 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.GetMemQueryCount
L0_1 = L0_1()
if L0_1 ~= nil and 0 < L0_1 then
  L1_1 = "SMS_ExitEvent_Counter"
  L2_1 = MpCommon
  L2_1 = L2_1.AtomicCounterValue
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AtomicCounterSet
    L4_1 = L1_1
    L5_1 = 1
    L6_1 = 3600
    L3_1(L4_1, L5_1, L6_1)
    L2_1 = 1
  else
    L3_1 = MpCommon
    L3_1 = L3_1.AtomicCounterAdd
    L4_1 = L1_1
    L5_1 = 1
    L3_1(L4_1, L5_1)
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.ppid
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[1]
        L3_1 = L3_1.utf8p2
        L4_1 = this_sigattrlog
        L4_1 = L4_1[1]
        L4_1 = L4_1.ppid
        L6_1 = L3_1
        L5_1 = L3_1.match
        L7_1 = "sigseq=([^;]+);"
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 == nil or L5_1 == "" then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L7_1 = L3_1
        L6_1 = L3_1.match
        L8_1 = "scancnt=(%d)"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 == nil or L6_1 == "" or L6_1 == "0" then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L8_1 = L3_1
        L7_1 = L3_1.match
        L9_1 = "reason=([^;]+);"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 == nil or L7_1 == "" then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = 0
        if L5_1 == "0x0" then
          L8_1 = 5
        elseif L7_1 == "exitproc" then
          L8_1 = 6
        elseif L7_1 == "max_scan" then
          L8_1 = 7
        elseif 1 < L0_1 then
          L8_1 = 8
        else
          L8_1 = L2_1 % 5
        end
        L9_1 = string
        L9_1 = L9_1.format
        L10_1 = "memQueryCount:%s;grp:%s;sigseq:%s;reason:%s"
        L11_1 = tostring
        L12_1 = L0_1
        L11_1 = L11_1(L12_1)
        L12_1 = tostring
        L13_1 = L8_1
        L12_1 = L12_1(L13_1)
        L13_1 = L5_1
        L14_1 = L7_1
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
        L10_1 = bm
        L10_1 = L10_1.trigger_sig
        L11_1 = "SMSHasValidMemoryQueryData"
        L12_1 = L9_1
        L13_1 = L4_1
        L10_1(L11_1, L12_1, L13_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
