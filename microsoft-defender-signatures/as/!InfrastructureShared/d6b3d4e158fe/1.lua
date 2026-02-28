local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.ContextualExpandEnvironmentVariables
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = {}
L2_1 = " -encode "
L3_1 = " -decode "
L4_1 = " -urlcache "
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "takari regulatory"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "template master"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L3_1 = contains
L4_1 = L2_1
L5_1 = "outlook.exe"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L2_1
L5_1 = "\\olk.exe"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "OFFICE"
L3_1[1] = L4_1
L4_1 = {}
L4_1.min = 1
L4_1.max = 5
L5_1 = QueryProcContext
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "SCRIPTENG"
L5_1[1] = L6_1
L6_1 = {}
L6_1.min = 1
L6_1.max = 5
L7_1 = QueryProcContext
L8_1 = L5_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.GetExecutablesFromCommandLine
L8_1 = L0_1
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L8_1 = ipairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    if L12_1 ~= nil and L12_1 ~= "" then
      L13_1 = sysio
      L13_1 = L13_1.IsFileExists
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if L13_1 then
        L13_1 = mp
        L13_1 = L13_1.IsKnownFriendlyFile
        L14_1 = L12_1
        L15_1 = false
        L16_1 = false
        L13_1 = L13_1(L14_1, L15_1, L16_1)
        if not L13_1 then
          L13_1 = bm
          L13_1 = L13_1.add_related_file
          L14_1 = L12_1
          L13_1(L14_1)
        end
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
