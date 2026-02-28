local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = 1
  L3_2 = A1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = bm
    L6_2 = L6_2.trigger_sig
    L7_2 = "VSSAMSI"
    L8_2 = A0_2
    L9_2 = A0_2
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = mp
    L6_2 = L6_2.GetParentProcInfo
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    if L6_2 == nil then
      break
    end
    L7_2 = L6_2.image_path
    if L7_2 then
      L9_2 = L7_2
      L8_2 = L7_2.match
      L10_2 = "\\([^\\]+)$"
      L8_2 = L8_2(L9_2, L10_2)
      if not L8_2 then
        break
      end
      A0_2 = L6_2.ppid
    else
      break
    end
  end
end

shadowdel = L0_1
L0_1 = MpCommon
L0_1 = L0_1.GetPersistContextNoPath
L1_1 = "vssamsipid"
L0_1 = L0_1(L1_1)
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = shadowdel
  L7_1 = L5_1
  L8_1 = 4
  L6_1(L7_1, L8_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
