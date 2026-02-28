local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = {}
L2_1[".one"] = true
L3_1 = bm_AddRelatedFileFromCommandLine
L4_1 = L1_1
L5_1 = L2_1
L6_1 = nil
L7_1 = 6
L3_1(L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = checkFileLastWriteTime
      L10_1 = L8_1
      L11_1 = 600
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 == false then
        L9_1 = bm
        L9_1 = L9_1.add_threat_file
        L10_1 = L8_1
        L9_1(L10_1)
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
