local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = {}
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.SIGATTR_LOG_SZ
    if L1_1 == 0 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = pcall
    L2_1 = MpCommon
    L2_1 = L2_1.PathToWin32Path
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L1_1, L2_1 = L1_1(L2_1, L3_1)
    if L2_1 == nil or L2_1 == "" then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = "\\([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == nil or L3_1 == "" then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "-- how to open these files --.txt"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "notags.html"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "nocomment.html"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          goto lbl_74
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    do return L4_1 end
    ::lbl_74::
    L4_1 = sysio
    L4_1 = L4_1.GetFileSize
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L5_1 = {}
    L5_1[L2_1] = 1
    L6_1 = table
    L6_1 = L6_1.insert
    L7_1 = L0_1
    L8_1 = {}
    L8_1.NotePath = L2_1
    L8_1.NoteName = L3_1
    L8_1.NoteSize = L4_1
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
      L14_1 = sigattr_tail
      L14_1 = L14_1[L13_1]
      L15_1 = L14_1.attribute
      if L15_1 ~= 16384 then
        L15_1 = L14_1.attribute
        if L15_1 ~= 16386 then
          goto lbl_175
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
        L1_1 = L15_1
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
              L15_1 = L5_1[L6_1]
              if L15_1 ~= 1 and L3_1 == L7_1 then
                if L9_1 == L4_1 then
                  L8_1 = L8_1 + 1
                  L5_1[L6_1] = 1
                end
                L15_1 = table
                L15_1 = L15_1.insert
                L16_1 = L0_1
                L17_1 = {}
                L17_1.NotePath = L6_1
                L17_1.NoteName = L7_1
                L17_1.NoteSize = L9_1
                L15_1(L16_1, L17_1)
              end
              if 2 <= L8_1 then
                L15_1 = bm
                L15_1 = L15_1.add_related_string
                L16_1 = "RansomHaltX"
                L17_1 = safeJsonSerialize
                L18_1 = L0_1
                L17_1 = L17_1(L18_1)
                L18_1 = bm
                L18_1 = L18_1.RelatedStringBMReport
                L15_1(L16_1, L17_1, L18_1)
                L15_1 = extractRansomNote
                L16_1 = L2_1
                L15_1(L16_1)
                L15_1 = mp
                L15_1 = L15_1.INFECTED
                return L15_1
              end
            end
          end
        end
      end
      ::lbl_175::
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
