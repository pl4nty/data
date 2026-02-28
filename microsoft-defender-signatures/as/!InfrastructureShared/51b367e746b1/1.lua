local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.bitand
    L8_1 = L6_1.reason_ex
    L9_1 = 1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 == 1 then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = string
      L8_1 = L8_1.sub
      L9_1 = L6_1.image_path
      L10_1 = -13
      L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
      if L7_1 ~= "\\sqlservr.exe" then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = string
        L8_1 = L8_1.sub
        L9_1 = L6_1.image_path
        L10_1 = -13
        L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1)
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
        if L7_1 ~= "\\sqlagent.exe" then
          goto lbl_57
        end
      end
      L7_1 = pcall
      L8_1 = reportBmInfo
      L7_1, L8_1 = L7_1(L8_1)
      if not L7_1 and L8_1 then
        L9_1 = bm
        L9_1 = L9_1.add_related_string
        L10_1 = "bmInfoFailReason"
        L11_1 = tostring
        L12_1 = L8_1
        L11_1 = L11_1(L12_1)
        L12_1 = bm
        L12_1 = L12_1.RelatedStringBMReport
        L9_1(L10_1, L11_1, L12_1)
      end
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
  ::lbl_57::
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
