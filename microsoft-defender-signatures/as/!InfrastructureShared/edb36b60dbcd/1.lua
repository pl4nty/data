local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 50000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = false
L4_1 = false
L5_1 = 2
L6_1 = 2
L7_1 = 30
L8_1 = 5
L9_1 = "DataRemoval"
L10_1 = nil
L11_1 = this_sigattrlog
L11_1 = L11_1[1]
L11_1 = L11_1.matched
if L11_1 then
  L11_1 = this_sigattrlog
  L11_1 = L11_1[1]
  L11_1 = L11_1.wp2
  if L11_1 ~= nil then
    L11_1 = this_sigattrlog
    L11_1 = L11_1[1]
    L1_1 = L11_1.ppid
    L11_1 = string
    L11_1 = L11_1.lower
    L12_1 = this_sigattrlog
    L12_1 = L12_1[1]
    L12_1 = L12_1.utf8p2
    L11_1 = L11_1(L12_1)
    L2_1 = L11_1
    L0_1 = "rm"
    L11_1 = L9_1
    L12_1 = "_rm_"
    L10_1 = L11_1 .. L12_1
end
else
  L11_1 = this_sigattrlog
  L11_1 = L11_1[2]
  L11_1 = L11_1.matched
  if L11_1 then
    L11_1 = this_sigattrlog
    L11_1 = L11_1[2]
    L11_1 = L11_1.wp2
    if L11_1 ~= nil then
      L11_1 = this_sigattrlog
      L11_1 = L11_1[2]
      L1_1 = L11_1.ppid
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = this_sigattrlog
      L12_1 = L12_1[2]
      L12_1 = L12_1.utf8p2
      L11_1 = L11_1(L12_1)
      L2_1 = L11_1
      L0_1 = "rm"
      L11_1 = L9_1
      L12_1 = "_rm_"
      L10_1 = L11_1 .. L12_1
  end
  else
    L11_1 = this_sigattrlog
    L11_1 = L11_1[3]
    L11_1 = L11_1.matched
    if L11_1 then
      L11_1 = this_sigattrlog
      L11_1 = L11_1[3]
      L11_1 = L11_1.wp2
      if L11_1 ~= nil then
        L11_1 = this_sigattrlog
        L11_1 = L11_1[3]
        L1_1 = L11_1.ppid
        L11_1 = string
        L11_1 = L11_1.lower
        L12_1 = this_sigattrlog
        L12_1 = L12_1[3]
        L12_1 = L12_1.utf8p2
        L11_1 = L11_1(L12_1)
        L2_1 = L11_1
        L0_1 = "rm"
        L11_1 = L9_1
        L12_1 = "_rm_"
        L10_1 = L11_1 .. L12_1
    end
    else
      L11_1 = this_sigattrlog
      L11_1 = L11_1[4]
      L11_1 = L11_1.matched
      if L11_1 then
        L11_1 = this_sigattrlog
        L11_1 = L11_1[4]
        L11_1 = L11_1.wp2
        if L11_1 ~= nil then
          L11_1 = this_sigattrlog
          L11_1 = L11_1[4]
          L1_1 = L11_1.ppid
          L11_1 = string
          L11_1 = L11_1.lower
          L12_1 = this_sigattrlog
          L12_1 = L12_1[4]
          L12_1 = L12_1.utf8p2
          L11_1 = L11_1(L12_1)
          L2_1 = L11_1
          L0_1 = "rm"
          L11_1 = L9_1
          L12_1 = "_rm_"
          L10_1 = L11_1 .. L12_1
        end
      end
    end
  end
end
if L1_1 == nil or L2_1 == nil or L2_1 == L0_1 or L2_1 == "" then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = L10_1
L12_1 = "Path_"
L13_1 = L1_1
L11_1 = L11_1 .. L12_1 .. L13_1
L12_1 = mp
L12_1 = L12_1.GetExecutablesFromCommandLine
L13_1 = L2_1
L12_1 = L12_1(L13_1)
L13_1 = ipairs
L14_1 = L12_1
L13_1, L14_1, L15_1 = L13_1(L14_1)
for L16_1, L17_1 in L13_1, L14_1, L15_1 do
  L18_1 = string
  L18_1 = L18_1.find
  L19_1 = L17_1
  L20_1 = "rm "
  L21_1 = 1
  L22_1 = true
  L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
  if L18_1 == nil then
    L18_1 = IsPathIncludedLinuxRansomCheck
    L19_1 = L17_1
    L18_1 = L18_1(L19_1)
    if L18_1 then
      L3_1 = true
      L18_1 = ValidateUniqueRQThreshold
      L19_1 = L11_1
      L20_1 = L8_1
      L21_1 = L7_1
      L22_1 = L17_1
      L23_1 = ""
      L24_1 = L6_1
      L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
      if L18_1 then
        L4_1 = true
      end
    end
  end
end
L13_1 = L10_1
L14_1 = "Cmd_"
L15_1 = L1_1
L13_1 = L13_1 .. L14_1 .. L15_1
if L3_1 then
  L14_1 = ValidateUniqueRQThreshold
  L15_1 = L13_1
  L16_1 = L8_1
  L17_1 = L7_1
  L18_1 = L2_1
  L19_1 = ""
  L20_1 = L5_1
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
  if L14_1 then
    L14_1 = TrackPidAndTechniqueBM
    L15_1 = "BM"
    L16_1 = "T1485"
    L17_1 = "Impact_DataDestruction"
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
  if L4_1 then
    L14_1 = TrackPidAndTechniqueBM
    L15_1 = "BM"
    L16_1 = "T1485"
    L17_1 = "Impact_DataDestruction"
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
