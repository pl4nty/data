local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.GetBruteMatchData
L1_1 = L1_1()
L2_1 = L1_1.match_offset
L2_1 = L2_1 + 1
L3_1 = L1_1.match_offset
L3_1 = L3_1 + 1
L3_1 = L3_1 + 512
L4_1 = tostring
L5_1 = L1_1.is_header
if L5_1 then
  L5_1 = headerpage
  if L5_1 then
    goto lbl_18
  end
end
L5_1 = footerpage
::lbl_18::
L4_1 = L4_1(L5_1)
L5_1 = L4_1
L4_1 = L4_1.sub
L6_1 = L2_1
L7_1 = L3_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = L4_1
L4_1 = L4_1.lower
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetExecutablesFromCommandLine
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = sysio
  L11_1 = L11_1.IsFileExists
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.IsKnownFriendlyFile
    L12_1 = L10_1
    L13_1 = false
    L14_1 = false
    L11_1 = L11_1(L12_1, L13_1, L14_1)
    if not L11_1 then
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L10_1
      L13_1 = ".dll"
      L14_1 = -4
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.ReportLowfi
        L12_1 = L10_1
        L13_1 = 3071065115
        L11_1(L12_1, L13_1)
        L11_1 = AppendToRollingQueue
        L12_1 = "SuspTransportAgent"
        L13_1 = L10_1
        L14_1 = 1
        L15_1 = 86400
        L16_1 = 10
        L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
        L0_1 = true
      end
    end
  end
end
if L0_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
