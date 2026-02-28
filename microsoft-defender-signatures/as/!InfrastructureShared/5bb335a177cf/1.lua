local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
if L0_1 ~= nil then
  L0_1 = mp
  L0_1 = L0_1.SIGATTR_LOG_SZ
  if L0_1 == 0 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
  L0_1 = pcall
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L0_1, L1_1 = L0_1(L1_1, L2_1)
  if L1_1 == nil or L1_1 == "" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "\\([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil or L2_1 == "" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "-- how to open these files --.txt"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "notags.html"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "nocomment.html"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_68
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_68::
  L3_1 = sysio
  L3_1 = L3_1.GetFileSize
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L4_1 = {}
  L4_1[L1_1] = 1
  L5_1 = {}
  L6_1 = table
  L6_1 = L6_1.insert
  L7_1 = L5_1
  L8_1 = {}
  L8_1.NotePath = L1_1
  L8_1.NoteName = L2_1
  L8_1.NoteSize = L3_1
  L6_1(L7_1, L8_1)
  L6_1 = ""
  L7_1 = ""
  L8_1 = 1
  L9_1 = 0
  L10_1 = mp
  L10_1 = L10_1.SIGATTR_LOG_SZ
  L11_1 = 1
  L12_1 = -1
  for L13_1 = L10_1, L11_1, L12_1 do
    L14_1 = sigattr_head
    L14_1 = L14_1[L13_1]
    L15_1 = L14_1.attribute
    if L15_1 ~= 16384 then
      L15_1 = L14_1.attribute
      if L15_1 ~= 16386 then
        goto lbl_170
      end
    end
    L15_1 = L14_1.utf8p1
    if L15_1 then
      L15_1 = pcall
      L16_1 = MpCommon
      L16_1 = L16_1.PathToWin32Path
      L17_1 = L14_1.utf8p1
      L15_1, L16_1 = L15_1(L16_1, L17_1)
      L6_1 = L16_1
      L0_1 = L15_1
      if L6_1 ~= nil and L6_1 ~= "" then
        L15_1 = string
        L15_1 = L15_1.lower
        L16_1 = L6_1
        L15_1 = L15_1(L16_1)
        L6_1 = L15_1
        L15_1 = string
        L15_1 = L15_1.match
        L16_1 = L6_1
        L17_1 = "\\([^\\]+)$"
        L15_1 = L15_1(L16_1, L17_1)
        L7_1 = L15_1
        if L7_1 ~= nil and L7_1 ~= "" then
          L15_1 = sysio
          L15_1 = L15_1.GetFileSize
          L16_1 = L6_1
          L15_1 = L15_1(L16_1)
          L9_1 = L15_1
          if L9_1 ~= nil then
            L15_1 = L4_1[L6_1]
            if L15_1 ~= 1 and L2_1 == L7_1 and L9_1 == L3_1 then
              L8_1 = L8_1 + 1
              L4_1[L6_1] = 1
            end
            L15_1 = table
            L15_1 = L15_1.insert
            L16_1 = L5_1
            L17_1 = {}
            L17_1.NotePath = L6_1
            L17_1.NoteName = L7_1
            L17_1.NoteSize = L9_1
            L15_1(L16_1, L17_1)
            if 2 <= L8_1 then
              L15_1 = bm
              L15_1 = L15_1.add_related_string
              L16_1 = "RansomHaltY"
              L17_1 = safeJsonSerialize
              L18_1 = L5_1
              L17_1 = L17_1(L18_1)
              L18_1 = bm
              L18_1 = L18_1.RelatedStringBMReport
              L15_1(L16_1, L17_1, L18_1)
              L15_1 = extractRansomNote
              L16_1 = L1_1
              L15_1(L16_1)
              L15_1 = mp
              L15_1 = L15_1.INFECTED
              return L15_1
            end
          end
        end
      end
    end
    ::lbl_170::
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
