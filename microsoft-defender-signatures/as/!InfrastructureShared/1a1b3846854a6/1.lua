local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = tostring
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.utf8p2
    if not L6_1 then
      L6_1 = ""
    end
    L5_1 = L5_1(L6_1)
    L3_1 = L5_1
    L5_1 = tostring
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.utf8p2
    if not L6_1 then
      L6_1 = ""
    end
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L6_1 = L3_1
    L5_1 = L3_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L6_1 = L4_1
    L5_1 = L4_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L4_1 = L5_1
    if L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    if L3_1 ~= "" and L3_1 ~= L4_1 then
      L5_1 = isSimilarPath
      L6_1 = L4_1
      L7_1 = L3_1
      L8_1 = 80
      L9_1 = 4
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L1_1 = true
      L5_1 = "old_value_mismatch"
      L6_1 = "InProcServer32"
      L2_1 = L5_1 .. L6_1
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L6_1 = L6_1.utf8p1
      L7_1 = "({.-})"
      L5_1 = L5_1(L6_1, L7_1)
      L0_1 = L5_1
    else
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L6_1 = L6_1.utf8p1
      L7_1 = "HKCU\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.gsub
        L6_1 = this_sigattrlog
        L6_1 = L6_1[3]
        L6_1 = L6_1.utf8p1
        L7_1 = "HKCU\\"
        L8_1 = "HKLM\\"
        L5_1 = L5_1(L6_1, L7_1, L8_1)
        L6_1 = GetRegistryValue
        L7_1 = L5_1
        L8_1 = ""
        L6_1 = L6_1(L7_1, L8_1)
        L8_1 = L6_1
        L7_1 = L6_1.gsub
        L9_1 = "[\128-\255]"
        L10_1 = ""
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L6_1 = L7_1
        if L6_1 and L6_1 ~= "" and L6_1 ~= L4_1 then
          L3_1 = L6_1
          L7_1 = isSimilarPath
          L8_1 = L4_1
          L9_1 = L6_1
          L10_1 = 80
          L11_1 = 4
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 then
            L7_1 = mp
            L7_1 = L7_1.CLEAN
            return L7_1
          end
          L1_1 = true
          L7_1 = "hklm_hkcu_mismatch"
          L8_1 = "InProcServer32"
          L2_1 = L7_1 .. L8_1
          L7_1 = string
          L7_1 = L7_1.match
          L8_1 = this_sigattrlog
          L8_1 = L8_1[3]
          L8_1 = L8_1.utf8p1
          L9_1 = "({.-})"
          L7_1 = L7_1(L8_1, L9_1)
          L0_1 = L7_1
        end
      end
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[4]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = tostring
    L6_1 = this_sigattrlog
    L6_1 = L6_1[2]
    L6_1 = L6_1.utf8p2
    if not L6_1 then
      L6_1 = ""
    end
    L5_1 = L5_1(L6_1)
    L3_1 = L5_1
    L5_1 = tostring
    L6_1 = this_sigattrlog
    L6_1 = L6_1[4]
    L6_1 = L6_1.utf8p2
    if not L6_1 then
      L6_1 = ""
    end
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L6_1 = L3_1
    L5_1 = L3_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L6_1 = L4_1
    L5_1 = L4_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L4_1 = L5_1
    if L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    if L3_1 ~= "" and L3_1 ~= L4_1 then
      L5_1 = isSimilarPath
      L6_1 = L4_1
      L7_1 = L3_1
      L8_1 = 80
      L9_1 = 4
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L1_1 = true
      L5_1 = "old_value_mismatch"
      L6_1 = "LocalServer32"
      L2_1 = L5_1 .. L6_1
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.utf8p1
      L7_1 = "({.-})"
      L5_1 = L5_1(L6_1, L7_1)
      L0_1 = L5_1
    else
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.utf8p1
      L7_1 = "HKCU\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.gsub
        L6_1 = this_sigattrlog
        L6_1 = L6_1[4]
        L6_1 = L6_1.utf8p1
        L7_1 = "HKCU\\"
        L8_1 = "HKLM\\"
        L5_1 = L5_1(L6_1, L7_1, L8_1)
        L6_1 = GetRegistryValue
        L7_1 = L5_1
        L8_1 = ""
        L6_1 = L6_1(L7_1, L8_1)
        L8_1 = L6_1
        L7_1 = L6_1.gsub
        L9_1 = "[\128-\255]"
        L10_1 = ""
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L6_1 = L7_1
        if L6_1 and L6_1 ~= "" and L6_1 ~= L4_1 then
          L3_1 = L6_1
          L7_1 = isSimilarPath
          L8_1 = L4_1
          L9_1 = L6_1
          L10_1 = 80
          L11_1 = 4
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 then
            L7_1 = mp
            L7_1 = L7_1.CLEAN
            return L7_1
          end
          L1_1 = true
          L7_1 = "hklm_hkcu_mismatch"
          L8_1 = "LocalServer32"
          L2_1 = L7_1 .. L8_1
          L7_1 = string
          L7_1 = L7_1.match
          L8_1 = this_sigattrlog
          L8_1 = L8_1[4]
          L8_1 = L8_1.utf8p1
          L9_1 = "({.-})"
          L7_1 = L7_1(L8_1, L9_1)
          L0_1 = L7_1
        end
      end
    end
  end
end
if L1_1 then
  L5_1 = 0
  L6_1 = {}
  L7_1 = add_parents
  L7_1 = L7_1()
  L6_1.parents = L7_1
  L7_1 = bm
  L7_1 = L7_1.get_imagepath
  L7_1 = L7_1()
  L6_1.processname = L7_1
  L6_1.reason = L2_1
  L6_1.appId = L0_1
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L4_1 = L7_1
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  L3_1 = L7_1
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L4_1
  L9_1 = "%w:\\.*.exe"
  L7_1 = L7_1(L8_1, L9_1)
  L4_1 = L7_1 or L4_1
  if not L7_1 then
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L4_1
    L9_1 = "%w:\\.*.dll"
    L7_1 = L7_1(L8_1, L9_1)
    L4_1 = L7_1
  end
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L3_1
  L9_1 = "%w:\\.*.exe"
  L7_1 = L7_1(L8_1, L9_1)
  L3_1 = L7_1 or L3_1
  if not L7_1 then
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L3_1
    L9_1 = "%w:\\.*.dll"
    L7_1 = L7_1(L8_1, L9_1)
    L3_1 = L7_1
  end
  L6_1.From_Value = L3_1
  L6_1.To_value = L4_1
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L4_1
  L9_1 = "([^\\]+)$"
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = string
  L8_1 = L8_1.match
  L9_1 = L3_1
  L10_1 = "([^\\]+)$"
  L8_1 = L8_1(L9_1, L10_1)
  if L7_1 ~= L8_1 then
    L5_1 = L5_1 + 10
  end
  L7_1 = string
  L7_1 = L7_1.gsub
  L8_1 = L4_1
  L9_1 = "\\"
  L10_1 = "\\\\"
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L9_1 = L7_1
  L8_1 = L7_1.gsub
  L10_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
  L11_1 = "\\%1"
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1 = L8_1
  L8_1 = pcall
  L9_1 = MpCommon
  L9_1 = L9_1.RollingQueueQueryKeyRegex
  L10_1 = "RQ_RecentExecDropped_MultipleKey_30m"
  L11_1 = L7_1
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
  if L8_1 and L9_1 then
    L10_1 = L9_1.value
    if L10_1 then
      L10_1 = {}
      L11_1 = L9_1
      L10_1[1] = L11_1
      L9_1 = L10_1
    end
    L6_1.FileDroppedRecently = true
    L6_1.FileInfo = L9_1
    L10_1 = ipairs
    L11_1 = L9_1
    L10_1, L11_1, L12_1 = L10_1(L11_1)
    for L13_1, L14_1 in L10_1, L11_1, L12_1 do
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L14_1.value
      L17_1 = "UnsignedFile"
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 then
        L5_1 = L5_1 + 20
        break
      end
    end
  else
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L6_1.Score = L5_1
  if L5_1 == 0 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = safeJsonSerialize
  L11_1 = L6_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    L10_1 = L6_1.processname
    if not L10_1 then
      L10_1 = ""
    end
  end
  L11_1 = bm
  L11_1 = L11_1.add_related_string
  L12_1 = "AdditionalInfo"
  L13_1 = L10_1
  L14_1 = bm
  L14_1 = L14_1.RelatedStringBMReport
  L11_1(L12_1, L13_1, L14_1)
  L11_1 = bm
  L11_1 = L11_1.add_related_file
  L12_1 = L4_1
  L11_1(L12_1)
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
