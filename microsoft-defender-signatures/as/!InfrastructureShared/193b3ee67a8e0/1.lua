local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p2
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L0_1 = L1_1.utf8p2
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L0_1 = L1_1.utf8p2
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L0_1 = L1_1.utf8p2
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L0_1 = L1_1.utf8p2
        else
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
      end
    end
  end
end
L1_1 = L0_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "\\start menu\\programs\\startup\\"
L4_1 = "\\microsoft\\templates\\"
L5_1 = "\\microsoft\\word\\startup\\"
L6_1 = "\\microsoft\\excel\\xlstart\\"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L3_1 = false
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L1_1
  L11_1 = L8_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L3_1 = true
    break
  end
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "\\windows defender\\msmpeng.exe"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L5_1 = nil
L6_1 = mp
L6_1 = L6_1.GetExecutablesFromCommandLine
L7_1 = L1_1
L6_1 = L6_1(L7_1)
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = L6_1[2]
  if L7_1 ~= nil then
    L5_1 = L6_1[2]
  else
    L7_1 = L6_1[1]
    if L7_1 ~= nil then
      L5_1 = L6_1[1]
    end
  end
end
L7_1 = bm
L7_1 = L7_1.add_related_string
L8_1 = "ScriptCmdline"
L9_1 = L1_1
L10_1 = bm
L10_1 = L10_1.RelatedStringBMReport
L7_1(L8_1, L9_1, L10_1)
if L5_1 ~= nil then
  L7_1 = sysio
  L7_1 = L7_1.IsFileExists
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L7_1 = bm
    L7_1 = L7_1.add_related_file
    L8_1 = L5_1
    L7_1(L8_1)
    L7_1 = bm
    L7_1 = L7_1.add_threat_file
    L8_1 = L5_1
    L7_1(L8_1)
  end
end
L7_1 = add_parents
L7_1()
L7_1 = TrackPidAndTechniqueBM
L8_1 = "BM"
L9_1 = "T1059.005"
L10_1 = "startup_script_exec"
L7_1(L8_1, L9_1, L10_1)
L7_1 = TrackPidAndTechniqueBM
L8_1 = "BM"
L9_1 = "T1547.001"
L10_1 = "startup_persistence_exec"
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
