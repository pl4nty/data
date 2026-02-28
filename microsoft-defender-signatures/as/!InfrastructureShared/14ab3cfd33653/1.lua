local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = triggerMemoryScanOnProcessTree
L1_1 = true
L2_1 = true
L3_1 = "SMS_M"
L4_1 = 1000
L5_1 = "Behavior:Win32/Qakbot.SA"
L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p2
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L1_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L1_1 = L2_1.utf8p2
    end
  end
end
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetInlineScriptsFromCommandLine
L5_1 = L0_1
L4_1 = L0_1.lower
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L4_1(L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L2_1 and L3_1 then
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = pcall
    L10_1 = mp
    L10_1 = L10_1.ContextualExpandEnvironmentVariables
    L11_1 = L8_1
    L9_1, L10_1 = L9_1(L10_1, L11_1)
    if L9_1 and L10_1 then
      L11_1 = bm
      L11_1 = L11_1.add_threat_file
      L12_1 = L10_1
      L11_1(L12_1)
    end
  end
end
L4_1 = extractDllForRegproc
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = mp
  L5_1 = L5_1.IsKnownFriendlyFile
  L6_1 = L4_1
  L7_1 = true
  L8_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 == false then
    L5_1 = bm
    L5_1 = L5_1.add_threat_file
    L6_1 = L4_1
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
