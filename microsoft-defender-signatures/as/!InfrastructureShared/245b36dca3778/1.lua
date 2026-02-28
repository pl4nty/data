local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = MpCommon
L0_1 = L0_1.NidSearch
L1_1 = mp
L1_1 = L1_1.NID_ENABLE_EXTENDED_BAFS
L2_1 = 6
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.add_related_string
  L1_1 = "AdditionalInfo"
  L2_1 = "E5EmergencyAntiTampering"
  L3_1 = bm
  L3_1 = L3_1.RelatedStringBMReport
  L0_1(L1_1, L2_1, L3_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = {}
L1_1 = {}
L2_1 = "wttsvc.exe"
L3_1 = ""
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = {}
L3_1 = "TeamViewer"
L4_1 = ""
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "UEMS_Agent"
L5_1 = ""
L3_1[1] = L4_1
L3_1[2] = L5_1
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 then
  L2_1 = L1_1.ppid
  if L2_1 then
    goto lbl_44
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_44::
L2_1 = checkParentCmdlineCaseInsensitive
L3_1 = L1_1.ppid
L4_1 = L0_1
L5_1 = 4
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L7_1 = "bcdedit.exe"
L8_1 = "reg.exe"
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = bm
L7_1 = L7_1.get_imagepath
L7_1 = L7_1()
L8_1 = L7_1
L7_1 = L7_1.match
L9_1 = "([^\\]+)$"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L9_1 = L7_1
L8_1 = L7_1.lower
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = ipairs
L9_1 = L6_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = string
  L13_1 = L13_1.find
  L14_1 = L7_1
  L15_1 = L12_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 then
    L13_1 = add_parents
    L13_1 = L13_1()
    L14_1 = {}
    L15_1 = ipairs
    L16_1 = L13_1
    L15_1, L16_1, L17_1 = L15_1(L16_1)
    for L18_1, L19_1 in L15_1, L16_1, L17_1 do
      L21_1 = L19_1
      L20_1 = L19_1.match
      L22_1 = "([^\\]+)$"
      L20_1 = L20_1(L21_1, L22_1)
      L21_1 = table
      L21_1 = L21_1.insert
      L22_1 = L14_1
      L23_1 = L20_1
      L21_1(L22_1, L23_1)
    end
    L15_1 = GetRollingQueueKeys
    L16_1 = "NewlyRegisteredServices"
    L15_1 = L15_1(L16_1)
    if L15_1 then
      L16_1 = ipairs
      L17_1 = L15_1
      L16_1, L17_1, L18_1 = L16_1(L17_1)
      for L19_1, L20_1 in L16_1, L17_1, L18_1 do
        L21_1 = contains
        L22_1 = L20_1
        L23_1 = L14_1
        L21_1 = L21_1(L22_1, L23_1)
        if L21_1 then
          L21_1 = bm
          L21_1 = L21_1.add_related_string
          L22_1 = "RegisteredSrv"
          L23_1 = L20_1
          L24_1 = bm
          L24_1 = L24_1.RelatedStringBMReport
          L21_1(L22_1, L23_1, L24_1)
          break
        end
      end
    end
    L16_1 = reportRelevantUntrustedEntities
    L17_1 = 0
    L16_1 = L16_1(L17_1)
    if L16_1 then
      L17_1 = next
      L18_1 = L16_1
      L17_1 = L17_1(L18_1)
      if L17_1 then
        L17_1 = bm
        L17_1 = L17_1.add_related_string
        L18_1 = "HasUntrustedEntities"
        L19_1 = "true"
        L20_1 = bm
        L20_1 = L20_1.RelatedStringBMReport
        L17_1(L18_1, L19_1, L20_1)
        L17_1 = bm
        L17_1 = L17_1.add_related_string
        L18_1 = "UntrustedEntities"
        L19_1 = safeJsonSerialize
        L20_1 = L16_1
        L19_1 = L19_1(L20_1)
        L20_1 = bm
        L20_1 = L20_1.RelatedStringBMReport
        L17_1(L18_1, L19_1, L20_1)
      end
    end
    L17_1 = mp
    L17_1 = L17_1.INFECTED
    return L17_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
