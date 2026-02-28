local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
    L7_1 = string
    L7_1 = L7_1.lower
    L9_1 = L6_1
    L8_1 = L6_1.match
    L10_1 = "\\([^\\]+)$"
    L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
    L8_1 = {}
    L8_1["pasensorservices.exe"] = true
    L9_1 = L8_1[L7_1]
    if not L9_1 then
      L9_1 = sysio
      L9_1 = L9_1.IsFileExists
      L10_1 = L6_1
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.IsKnownFriendlyFile
        L10_1 = L6_1
        L11_1 = true
        L12_1 = false
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if L9_1 then
          L9_1 = {}
          L9_1["mpksldrv.sys"] = true
          L9_1["ccmsetup.exe"] = true
          L9_1["svchost.exe"] = true
          L9_1["mbamswissarmy.sys"] = true
          L9_1["cyclorama64.sys"] = true
          L10_1 = L9_1[L7_1]
          if not L10_1 then
            L10_1 = mp
            L10_1 = L10_1.ReportLowfi
            L11_1 = L6_1
            L12_1 = 1394183950
            L10_1(L11_1, L12_1)
          end
        else
          L9_1 = mp
          L9_1 = L9_1.ReportLowfi
          L10_1 = L6_1
          L11_1 = 3656319915
          L9_1(L10_1, L11_1)
          L9_1 = TrackFileAndTechnique
          L10_1 = L6_1
          L11_1 = "T1543.003:exec_service_binary"
          L12_1 = 1000
          L9_1(L10_1, L11_1, L12_1)
        end
        L9_1 = bm
        L9_1 = L9_1.add_related_file
        L10_1 = L6_1
        L9_1(L10_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
