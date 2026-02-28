local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdriver
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdamaged
    if not L0_1 then
      goto lbl_16
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "CLOUD:RoxstageBlockAccess"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "BM_RoxstageProcessBlock"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.QueryPersistContext
  L2_1 = L0_1
  L3_1 = "BM_RoxstageProcessBlock"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "CLOUD:RoxstageBlockAccess"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "CLOUD:RoxstageBlockAccess"
  L4_1 = 0
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
