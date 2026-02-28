local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "BMLowfiTrigger"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.GetPersistContext
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = "^SLF:"
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L7_1
    L10_1 = "^ALF:"
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L7_1
      L10_1 = "^TEL:"
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        goto lbl_56
      end
    end
  end
  L8_1 = bm
  L8_1 = L8_1.trigger_sig
  L9_1 = "BMLowfiTrigger"
  L10_1 = L7_1
  L8_1(L9_1, L10_1)
  ::lbl_56::
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
