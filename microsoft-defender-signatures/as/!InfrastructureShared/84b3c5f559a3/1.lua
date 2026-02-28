local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L1_1 = L0_1.matched
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p2
L3_1 = "([0-9]+);localvmallocregionsize:([0-9]+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_27
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_27::
L3_1 = tonumber
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 < 100000 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1.utf8p1
L5_1 = "targetprocessppid:(%d+):(%d+)"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = isnull
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_58
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_58::
L5_1 = tonumber
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L3_1 = L5_1
L5_1 = tonumber
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = string
L5_1 = L5_1.format
L6_1 = "pid:%d,ProcessStart:%d"
L7_1 = L3_1
L8_1 = L4_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = bm
L6_1 = L6_1.VirtualQuery
L7_1 = L1_1
L8_1 = L5_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L8_1 = L7_1.prot
  if L8_1 == 64 then
    L8_1 = L7_1.state_type
    L9_1 = mp
    L9_1 = L9_1.bitor
    L10_1 = mp
    L10_1 = L10_1.SMS_MBI_COMMIT
    L11_1 = mp
    L11_1 = L11_1.SMS_MBI_PRIVATE
    L9_1 = L9_1(L10_1, L11_1)
    if L8_1 == L9_1 then
      goto lbl_95
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_95::
L8_1 = TriggerTargetedMemoryScan
L9_1 = L1_1
L10_1 = L5_1
L8_1(L9_1, L10_1)
L8_1 = bm
L8_1 = L8_1.ReadProcMem
L9_1 = L1_1
L10_1 = 256
L11_1 = L5_1
L8_1 = L8_1(L9_1, L10_1, L11_1)
if L8_1 ~= nil then
  L9_1 = mp
  L9_1 = L9_1.readu_u32
  L10_1 = L8_1
  L11_1 = 1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == 9460301 then
    L10_1 = TrackPidAndTechniqueBM
    L11_1 = L5_1
    L12_1 = "T1055.002"
    L13_1 = "pe_injection_target"
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
