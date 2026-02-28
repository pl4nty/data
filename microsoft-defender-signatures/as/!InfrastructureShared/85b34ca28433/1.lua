local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = mp
    L7_1 = L7_1.ContextualExpandEnvironmentVariables
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.IsKnownFriendlyFile
      L8_1 = L6_1
      L9_1 = true
      L10_1 = false
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 then
        L7_1 = mp
        L7_1 = L7_1.ReportLowfi
        L8_1 = L6_1
        L9_1 = 1394183950
        L7_1(L8_1, L9_1)
      else
        L7_1 = TrackFileAndTechnique
        L8_1 = L6_1
        L9_1 = "T1543.003:exec_service_binary"
        L10_1 = 1000
        L7_1(L8_1, L9_1, L10_1)
        L7_1 = mp
        L7_1 = L7_1.ReportLowfi
        L8_1 = L6_1
        L9_1 = 3656319915
        L7_1(L8_1, L9_1)
      end
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
