local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = L1_1.command_line
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = L2_1
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
        L9_1 = bm
        L9_1 = L9_1.add_related_file
        L10_1 = L8_1
        L9_1(L10_1)
      end
    end
  end
end
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L2_1 = L4_1.utf8p2
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L3_1 = L4_1.utf8p1
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[7]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[7]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[7]
    L3_1 = L4_1.utf8p1
  end
end
if L2_1 ~= nil and L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.lower
  L6_1 = L3_1
  L5_1 = L3_1.match
  L7_1 = "\\([^\\]+)$"
  L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  L6_1 = L2_1
  L5_1 = L2_1.find
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = bm
      L5_1 = L5_1.add_threat_file
      L6_1 = L3_1
      L5_1(L6_1)
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
