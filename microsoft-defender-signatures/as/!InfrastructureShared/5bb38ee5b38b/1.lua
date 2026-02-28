local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
L0_1 = L1_1 or L0_1
if not L1_1 then
  L0_1 = -1
end
L1_1 = "genb_ransom_meta_"
L2_1 = L0_1
L1_1 = L1_1 .. L2_1
L2_1 = MpCommon
L2_1 = L2_1.RollingQueueCount
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil and 25 <= L2_1 and L2_1 <= 100 then
  L3_1 = GetRollingQueue
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = type
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 == "table" then
      goto lbl_34
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_34::
  L4_1 = {}
  L5_1 = nil
  L6_1 = ""
  L7_1 = ""
  L8_1 = {}
  L9_1 = 0
  L10_1 = {}
  L11_1 = 0
  L12_1 = 0
  L13_1 = {}
  L14_1 = 0
  L15_1 = 0
  L16_1 = ""
  L17_1 = false
  L18_1 = ipairs
  L19_1 = L3_1
  L18_1, L19_1, L20_1 = L18_1(L19_1)
  for L21_1, L22_1 in L18_1, L19_1, L20_1 do
    L23_1 = explode
    L24_1 = L22_1.value
    L25_1 = "|"
    L23_1 = L23_1(L24_1, L25_1)
    L5_1 = L23_1
    L23_1 = table
    L23_1 = L23_1.insert
    L24_1 = L4_1
    L25_1 = {}
    L26_1 = L5_1[1]
    L25_1.Extension = L26_1
    L26_1 = L5_1[2]
    L25_1.NewFileName = L26_1
    L26_1 = L5_1[3]
    L25_1.OldFileName = L26_1
    L26_1 = L5_1[4]
    L25_1.FileType = L26_1
    L26_1 = L5_1[5]
    L25_1.FileSize = L26_1
    L26_1 = L5_1[6]
    L25_1.MagicByte = L26_1
    L26_1 = L5_1[7]
    L25_1.Entropy = L26_1
    L23_1(L24_1, L25_1)
    L23_1 = L5_1[1]
    L23_1 = L10_1[L23_1]
    if L23_1 ~= 1 then
      L11_1 = L11_1 + 1
      L23_1 = L5_1[1]
      L10_1[L23_1] = 1
    end
    L23_1 = string
    L23_1 = L23_1.match
    L24_1 = L5_1[2]
    L25_1 = "(.*[/\\])"
    L23_1 = L23_1(L24_1, L25_1)
    L6_1 = L23_1
    L23_1 = mp
    L23_1 = L23_1.crc32
    L24_1 = 0
    L25_1 = L6_1
    L26_1 = 1
    L27_1 = #L6_1
    L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1)
    L7_1 = L23_1
    L23_1 = L8_1[L7_1]
    if L23_1 ~= 1 then
      L9_1 = L9_1 + 1
      L8_1[L7_1] = 1
    end
    L23_1 = string
    L23_1 = L23_1.match
    L24_1 = L5_1[3]
    L25_1 = "(.*[/\\])"
    L23_1 = L23_1(L24_1, L25_1)
    L16_1 = L23_1
    if L16_1 ~= L6_1 and L17_1 == false then
      L17_1 = true
    end
    L23_1 = L5_1[4]
    if L23_1 == "Unknown" then
      L12_1 = L12_1 + 1
    end
    L23_1 = L5_1[6]
    L23_1 = L13_1[L23_1]
    if L23_1 ~= 1 then
      L14_1 = L14_1 + 1
      L23_1 = L5_1[6]
      L13_1[L23_1] = 1
    end
    L23_1 = L5_1[7]
    if 7 <= L23_1 then
      L15_1 = L15_1 + 1
    end
  end
  L18_1 = bm
  L18_1 = L18_1.add_related_string
  L19_1 = "GenBRollingQueueData"
  L20_1 = safeJsonSerialize
  L21_1 = L4_1
  L20_1 = L20_1(L21_1)
  L21_1 = bm
  L21_1 = L21_1.RelatedStringBMReport
  L18_1(L19_1, L20_1, L21_1)
  L18_1 = 0
  if L11_1 == 1 then
    L18_1 = L18_1 + 1
  end
  if 3 < L9_1 then
    L18_1 = L18_1 + 1
  end
  if L17_1 == false then
    L18_1 = L18_1 + 1
  end
  if L12_1 == L2_1 then
    L18_1 = L18_1 + 1
  end
  if L14_1 == 1 then
    L18_1 = L18_1 + 1
  end
  if L15_1 == L2_1 then
    L18_1 = L18_1 + 1
  end
  if 4 <= L18_1 then
    L19_1 = reportSessionInformationInclusive
    L19_1()
    L19_1 = sms_untrusted_process
    L19_1()
    L19_1 = mp
    L19_1 = L19_1.INFECTED
    return L19_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
