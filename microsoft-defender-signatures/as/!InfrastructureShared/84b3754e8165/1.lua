local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = {}
L0_1["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
L0_1.a738f2d8360e0243af067b2bb537c54d52bf679f = true
L0_1["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = scrubData
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = L0_1[L2_1]
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L4_1 = L3_1.matched
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1.utf8p2
L6_1 = "([0-9]+);localvmallocregionsize:([0-9]+)"
L4_1, L5_1 = L4_1(L5_1, L6_1)
L6_1 = isnull
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L6_1 = isnull
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    goto lbl_51
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_51::
L6_1 = tonumber
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L4_1 = L6_1
L6_1 = tonumber
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
if L5_1 < 100000 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.match
L7_1 = L3_1.utf8p1
L8_1 = "targetprocessppid:(%d+):(%d+)"
L6_1, L7_1 = L6_1(L7_1, L8_1)
L8_1 = isnull
L9_1 = L6_1
L8_1 = L8_1(L9_1)
if not L8_1 then
  L8_1 = isnull
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    goto lbl_82
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_82::
L8_1 = tonumber
L9_1 = L6_1
L8_1 = L8_1(L9_1)
L6_1 = L8_1
L8_1 = tonumber
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = string
L8_1 = L8_1.format
L9_1 = "pid:%d,ProcessStart:%d"
L10_1 = L6_1
L11_1 = L7_1
L8_1 = L8_1(L9_1, L10_1, L11_1)
L9_1 = bm
L9_1 = L9_1.VirtualQuery
L10_1 = L4_1
L11_1 = L8_1
L9_1, L10_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L11_1 = L10_1.prot
  if L11_1 == 64 then
    L11_1 = L10_1.state_type
    L12_1 = mp
    L12_1 = L12_1.bitor
    L13_1 = mp
    L13_1 = L13_1.SMS_MBI_COMMIT
    L14_1 = mp
    L14_1 = L14_1.SMS_MBI_PRIVATE
    L12_1 = L12_1(L13_1, L14_1)
    if L11_1 == L12_1 then
      goto lbl_119
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
do return L11_1 end
::lbl_119::
L11_1 = TriggerTargetedMemoryScan
L12_1 = L4_1
L13_1 = L8_1
L11_1(L12_1, L13_1)
L11_1 = bm
L11_1 = L11_1.ReadProcMem
L12_1 = L4_1
L13_1 = 256
L14_1 = L8_1
L11_1 = L11_1(L12_1, L13_1, L14_1)
if L11_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.readu_u32
  L13_1 = L11_1
  L14_1 = 1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 == 9460301 then
    L13_1 = TrackPidAndTechniqueBM
    L14_1 = L8_1
    L15_1 = "T1055.002"
    L16_1 = "pe_injection_target"
    L13_1(L14_1, L15_1, L16_1)
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
