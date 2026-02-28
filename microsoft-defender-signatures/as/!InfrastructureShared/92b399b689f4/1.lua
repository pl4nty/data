local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L3_1 = {}
L3_1[L1_1] = 1
L4_1 = {}
L5_1 = table
L5_1 = L5_1.insert
L6_1 = L4_1
L7_1 = {}
L7_1.NotePath = L1_1
L7_1.NoteName = L2_1
L5_1(L6_1, L7_1)
L5_1 = ""
L6_1 = ""
L7_1 = 0
L8_1 = this_sigattrlog
L8_1 = L8_1[3]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[3]
  L8_1 = L8_1.utf8p1
  if L8_1 ~= nil then
    L8_1 = pcall
    L9_1 = MpCommon
    L9_1 = L9_1.PathToWin32Path
    L10_1 = this_sigattrlog
    L10_1 = L10_1[3]
    L10_1 = L10_1.utf8p1
    L8_1, L9_1 = L8_1(L9_1, L10_1)
    L5_1 = L9_1
    L0_1 = L8_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    L5_1 = L8_1
    if L5_1 ~= nil and L5_1 ~= "" then
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L5_1
      L10_1 = "\\([^\\]+)$"
      L8_1 = L8_1(L9_1, L10_1)
      L6_1 = L8_1
      if L6_1 ~= nil and L6_1 ~= "" then
        L8_1 = L3_1[L5_1]
        if L8_1 ~= 1 and L2_1 == L6_1 then
          L7_1 = L7_1 + 1
          L3_1[L5_1] = 1
          L8_1 = table
          L8_1 = L8_1.insert
          L9_1 = L4_1
          L10_1 = {}
          L10_1.NotePath = L5_1
          L10_1.NoteName = L6_1
          L8_1(L9_1, L10_1)
        end
      end
    end
  end
end
L8_1 = this_sigattrlog
L8_1 = L8_1[4]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[4]
  L8_1 = L8_1.utf8p1
  if L8_1 ~= nil then
    L8_1 = pcall
    L9_1 = MpCommon
    L9_1 = L9_1.PathToWin32Path
    L10_1 = this_sigattrlog
    L10_1 = L10_1[4]
    L10_1 = L10_1.utf8p1
    L8_1, L9_1 = L8_1(L9_1, L10_1)
    L5_1 = L9_1
    L0_1 = L8_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    L5_1 = L8_1
    if L5_1 ~= nil and L5_1 ~= "" then
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L5_1
      L10_1 = "\\([^\\]+)$"
      L8_1 = L8_1(L9_1, L10_1)
      L6_1 = L8_1
      if L6_1 ~= nil and L6_1 ~= "" then
        L8_1 = L3_1[L5_1]
        if L8_1 ~= 1 and L2_1 == L6_1 then
          L7_1 = L7_1 + 1
          L3_1[L5_1] = 1
          L8_1 = table
          L8_1 = L8_1.insert
          L9_1 = L4_1
          L10_1 = {}
          L10_1.NotePath = L5_1
          L10_1.NoteName = L6_1
          L8_1(L9_1, L10_1)
        end
      end
    end
  end
end
L8_1 = this_sigattrlog
L8_1 = L8_1[5]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[5]
  L8_1 = L8_1.utf8p1
  if L8_1 ~= nil then
    L8_1 = pcall
    L9_1 = MpCommon
    L9_1 = L9_1.PathToWin32Path
    L10_1 = this_sigattrlog
    L10_1 = L10_1[5]
    L10_1 = L10_1.utf8p1
    L8_1, L9_1 = L8_1(L9_1, L10_1)
    L5_1 = L9_1
    L0_1 = L8_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    L5_1 = L8_1
    if L5_1 ~= nil and L5_1 ~= "" then
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L5_1
      L10_1 = "\\([^\\]+)$"
      L8_1 = L8_1(L9_1, L10_1)
      L6_1 = L8_1
      if L6_1 ~= nil and L6_1 ~= "" then
        L8_1 = L3_1[L5_1]
        if L8_1 ~= 1 and L2_1 == L6_1 then
          L7_1 = L7_1 + 1
          L3_1[L5_1] = 1
          L8_1 = table
          L8_1 = L8_1.insert
          L9_1 = L4_1
          L10_1 = {}
          L10_1.NotePath = L5_1
          L10_1.NoteName = L6_1
          L8_1(L9_1, L10_1)
        end
      end
    end
  end
end
if L7_1 == 3 then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "RansomHaltZ"
  L10_1 = safeJsonSerialize
  L11_1 = L4_1
  L10_1 = L10_1(L11_1)
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = extractRansomNote
  L9_1 = L1_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
