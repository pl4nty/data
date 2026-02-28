local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = MpCommon
L0_1 = L0_1.NidSearch
L1_1 = mp
L1_1 = L1_1.NID_ENABLE_EXTENDED_BAFS
L2_1 = 7
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = "hmdprecisionpulse"
  L1_1 = "scan_counter"
  L2_1 = "max_scan"
  L3_1 = 60
  L4_1 = 500
  L5_1 = MpCommon
  L5_1 = L5_1.AtomicCounterValueNamespaced
  L6_1 = L1_1
  L7_1 = L0_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == nil then
    L6_1 = MpCommon
    L6_1 = L6_1.AtomicCounterSetNamespaced
    L7_1 = L1_1
    L8_1 = L0_1
    L9_1 = 0
    L10_1 = L3_1
    L6_1(L7_1, L8_1, L9_1, L10_1)
    L5_1 = 0
  end
  L6_1 = MpCommon
  L6_1 = L6_1.AtomicCounterValueNamespaced
  L7_1 = L2_1
  L8_1 = L0_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == nil then
    L7_1 = MpCommon
    L7_1 = L7_1.AtomicCounterSetNamespaced
    L8_1 = L2_1
    L9_1 = L0_1
    L10_1 = L4_1
    L11_1 = L3_1
    L7_1(L8_1, L9_1, L10_1, L11_1)
    L6_1 = L4_1
  end
  if L5_1 >= L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = mp
  L7_1 = L7_1.getfilename
  L8_1 = mp
  L8_1 = L8_1.bitor
  L9_1 = mp
  L9_1 = L9_1.bitor
  L10_1 = mp
  L10_1 = L10_1.FILEPATH_QUERY_FNAME
  L11_1 = mp
  L11_1 = L11_1.FILEPATH_QUERY_PATH
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = mp
  L10_1 = L10_1.FILEPATH_QUERY_LOWERCASE
  L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L8_1(L9_1, L10_1)
  L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
  if L7_1 == nil or L8_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = split
  L10_1 = L8_1
  L11_1 = "->"
  L9_1 = L9_1(L10_1, L11_1)
  L8_1 = L9_1[1]
  L9_1 = string
  L9_1 = L9_1.sub
  L10_1 = L7_1
  L11_1 = 0
  L12_1 = 4
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  if L9_1 == "\\\\?\\" then
    L9_1 = string
    L9_1 = L9_1.sub
    L10_1 = L7_1
    L11_1 = 5
    L9_1 = L9_1(L10_1, L11_1)
    L7_1 = L9_1
  end
  L9_1 = split
  L10_1 = L7_1
  L11_1 = "\\"
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = L9_1[2]
  if L10_1 == nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = pcall
  L11_1 = MpCommon
  L11_1 = L11_1.RollingQueueQueryKeyNamespaced
  L12_1 = "hmdprecisionpulsefolderscan"
  L13_1 = L0_1
  L14_1 = L7_1
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 and L11_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "MpNonPIIFileType"
    L12_1(L13_1)
    L12_1 = MpCommon
    L12_1 = L12_1.AtomicCounterAddNamespaced
    L13_1 = L1_1
    L14_1 = L0_1
    L15_1 = 1
    L12_1 = L12_1(L13_1, L14_1, L15_1)
    if L6_1 <= L12_1 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
  L12_1 = pcall
  L13_1 = MpCommon
  L13_1 = L13_1.RollingQueueQueryKeyNamespaced
  L14_1 = "hmdprecisionpulsefullfilepathscan"
  L15_1 = L0_1
  L16_1 = L7_1
  L17_1 = "\\"
  L18_1 = L8_1
  L16_1 = L16_1 .. L17_1 .. L18_1
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  if L12_1 and L13_1 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "MpNonPIIFileType"
    L14_1(L15_1)
    L14_1 = MpCommon
    L14_1 = L14_1.AtomicCounterAddNamespaced
    L15_1 = L1_1
    L16_1 = L0_1
    L17_1 = 1
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    if L6_1 <= L14_1 then
      L15_1 = mp
      L15_1 = L15_1.CLEAN
      return L15_1
    end
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
  L14_1 = pcall
  L15_1 = MpCommon
  L15_1 = L15_1.RollingQueueQueryKeyNamespaced
  L16_1 = "hmdprecisionpulsescanfile"
  L17_1 = L0_1
  L18_1 = L8_1
  L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if L14_1 and L15_1 then
    L16_1 = mp
    L16_1 = L16_1.set_mpattribute
    L17_1 = "MpNonPIIFileType"
    L16_1(L17_1)
    L16_1 = MpCommon
    L16_1 = L16_1.AtomicCounterAddNamespaced
    L17_1 = L1_1
    L18_1 = L0_1
    L19_1 = 1
    L16_1 = L16_1(L17_1, L18_1, L19_1)
    if L6_1 <= L16_1 then
      L17_1 = mp
      L17_1 = L17_1.CLEAN
      return L17_1
    end
    L17_1 = mp
    L17_1 = L17_1.INFECTED
    return L17_1
  end
  L16_1 = mp
  L16_1 = L16_1.CLEAN
  return L16_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
