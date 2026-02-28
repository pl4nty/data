local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if 100000000 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if L1_1 ~= nil and L1_1 ~= "" then
  L2_1 = IsExcludedByImagePath
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    L3_1 = isParentPackageManager
    L4_1 = L2_1.ppid
    L5_1 = true
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L3_1 = {}
L4_1 = "/bin/"
L5_1 = "/usr/bin/"
L6_1 = "/sbin/"
L7_1 = "/usr/sbin/"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = {}
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = 0
  L10_1 = sigattr_tail
  L10_1 = L10_1[L8_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16385 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    L11_1 = L10_1
    L10_1 = L10_1.lower
    L10_1 = L10_1(L11_1)
    L11_1 = pairs
    L12_1 = L3_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    for L14_1, L15_1 in L11_1, L12_1, L13_1 do
      L17_1 = L10_1
      L16_1 = L10_1.find
      L18_1 = L15_1
      L16_1 = L16_1(L17_1, L18_1)
      if L16_1 ~= nil then
        L9_1 = 1
        break
      end
    end
    if L9_1 == 0 then
      L11_1 = mp
      L11_1 = L11_1.crc32
      L12_1 = 0
      L13_1 = L10_1
      L14_1 = 1
      L15_1 = #L10_1
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      L4_1[L11_1] = 1
    end
  end
end
L5_1 = {}
L6_1 = 1
L7_1 = L0_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16386 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L9_1]
    L10_1 = L10_1.utf8p2
    L11_1 = L10_1
    L10_1 = L10_1.lower
    L10_1 = L10_1(L11_1)
    L11_1 = sigattr_tail
    L11_1 = L11_1[L9_1]
    L11_1 = L11_1.utf8p1
    L12_1 = L11_1
    L11_1 = L11_1.lower
    L11_1 = L11_1(L12_1)
    L12_1 = mp
    L12_1 = L12_1.crc32
    L13_1 = 0
    L14_1 = L10_1
    L15_1 = 1
    L16_1 = #L10_1
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    L13_1 = mp
    L13_1 = L13_1.crc32
    L14_1 = 0
    L15_1 = L11_1
    L16_1 = 1
    L17_1 = #L11_1
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    L14_1 = L4_1[L13_1]
    if L14_1 == nil then
      L14_1 = L4_1[L12_1]
      if L14_1 == nil then
        goto lbl_209
      end
    end
    L15_1 = L10_1
    L14_1 = L10_1.match
    L16_1 = "%.[^%.]+$"
    L14_1 = L14_1(L15_1, L16_1)
    if L14_1 ~= nil then
      L15_1 = #L10_1
      L16_1 = #L11_1
      if L15_1 < L16_1 then
        L16_1 = L11_1
        L15_1 = L11_1.byte
        L17_1 = #L10_1
        L17_1 = L17_1 + 1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 == 46 then
          L16_1 = L11_1
          L15_1 = L11_1.find
          L17_1 = L10_1
          L18_1 = 1
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
          if L15_1 == 1 then
            L15_1 = string
            L15_1 = L15_1.sub
            L16_1 = L11_1
            L17_1 = #L10_1
            L17_1 = L17_1 + 1
            L15_1 = L15_1(L16_1, L17_1)
            if L15_1 ~= nil then
              L16_1 = IsExcludedByImagePathFileExtension
              L17_1 = L1_1
              L18_1 = L15_1
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == false then
                L16_1 = IsExcludedByImagePathFileExtensionRegEx
                L17_1 = L1_1
                L18_1 = L15_1
                L16_1 = L16_1(L17_1, L18_1)
                if L16_1 == false then
                  L16_1 = IsExcludedByImagePathFileExtensionSuffix
                  L17_1 = L1_1
                  L18_1 = L15_1
                  L16_1 = L16_1(L17_1, L18_1)
                  if L16_1 == false then
                    L16_1 = IsExtensionDatePattern
                    L17_1 = L15_1
                    L16_1 = L16_1(L17_1)
                    if L16_1 == false then
                      L16_1 = L5_1[L15_1]
                      if L16_1 ~= nil then
                        L16_1 = table
                        L16_1 = L16_1.insert
                        L17_1 = L5_1[L15_1]
                        L18_1 = L9_1
                        L16_1(L17_1, L18_1)
                        L16_1 = L5_1[L15_1]
                        L16_1 = #L16_1
                        if 5 <= L16_1 then
                          L16_1 = TrackPidAndTechniqueBM
                          L17_1 = "BM"
                          L18_1 = "T1486"
                          L19_1 = "Impact_Ransom"
                          L16_1(L17_1, L18_1, L19_1)
                          L16_1 = mp
                          L16_1 = L16_1.INFECTED
                          return L16_1
                        end
                      else
                        L16_1 = {}
                        L17_1 = L9_1
                        L16_1[1] = L17_1
                        L5_1[L15_1] = L16_1
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_209::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
