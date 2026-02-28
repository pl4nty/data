local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = IsFileRecentlyDropped
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
if L1_1 and L2_1 and L3_1 then
  L4_1 = safeJsonDeserialize
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = L4_1.URL
    if L5_1 then
      L5_1 = L4_1.UnsignedFile
      if not L5_1 then
        L5_1 = bm
        L5_1 = L5_1.add_related_string
        L6_1 = "OysterLoader"
        L7_1 = safeJsonSerialize
        L8_1 = L4_1
        L7_1 = L7_1(L8_1)
        L8_1 = bm
        L8_1 = L8_1.RelatedStringBMReport
        L5_1(L6_1, L7_1, L8_1)
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
