local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "binpath=(.+)"
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = mp
  L2_1 = L2_1.GetExecutablesFromCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
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
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L8_1(L9_1, L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
    L8_1 = {}
    L8_1["pasensorservices.exe"] = true
    L9_1 = string
    L9_1 = L9_1.sub
    L10_1 = L6_1
    L11_1 = -4
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 == ".log" or L9_1 == ".etl" or L9_1 == ".txt" then
      L5_1 = true
    else
      L10_1 = L8_1[L7_1]
      if not L10_1 then
        L10_1 = sysio
        L10_1 = L10_1.IsFileExists
        L11_1 = L6_1
        L10_1 = L10_1(L11_1)
        if L10_1 == true then
          L10_1 = bm
          L10_1 = L10_1.add_related_file
          L11_1 = L6_1
          L10_1(L11_1)
          L10_1 = mp
          L10_1 = L10_1.IsKnownFriendlyFile
          L11_1 = L6_1
          L12_1 = true
          L13_1 = false
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          if L10_1 then
            L10_1 = mp
            L10_1 = L10_1.ReportLowfi
            L11_1 = L6_1
            L12_1 = 1394183950
            L10_1(L11_1, L12_1)
          else
            L10_1 = mp
            L10_1 = L10_1.ReportLowfi
            L11_1 = L6_1
            L12_1 = 3656319915
            L10_1(L11_1, L12_1)
            L10_1 = TrackFileAndTechnique
            L11_1 = L6_1
            L12_1 = "T1543.003:exec_service_binary"
            L13_1 = 1000
            L10_1(L11_1, L12_1, L13_1)
          end
        end
      end
    end
  end
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1543.003"
  L5_1 = "persistence"
  L2_1(L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
