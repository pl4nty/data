local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()
L0_1 = nil
L1_1 = nil
L2_1 = false
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L0_1 = L3_1.ppid
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L0_1 = L3_1.ppid
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
  end
end
if L0_1 == nil or L1_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = GetRealPidForScenario
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "powershell%.exe$"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "cmd%.exe$"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    goto lbl_118
  end
end
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = IsPidObservedGlobal
  L11_1 = L9_1.ppid
  L10_1 = L10_1(L11_1)
  if L10_1 then
    L10_1 = GetTacticsTableForPid
    L11_1 = L9_1.ppid
    L10_1 = L10_1(L11_1)
    L11_1 = GetTechniquesTableForPid
    L12_1 = L9_1.ppid
    L11_1 = L11_1(L12_1)
    if L10_1 ~= nil then
      L12_1 = pairs
      L13_1 = L10_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      for L15_1, L16_1 in L12_1, L13_1, L14_1 do
        L17_1 = AddTacticForPid
        L18_1 = L0_1
        L19_1 = L15_1
        L17_1(L18_1, L19_1)
        L2_1 = true
      end
    end
    if L11_1 ~= nil then
      L12_1 = pairs
      L13_1 = L11_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      for L15_1, L16_1 in L12_1, L13_1, L14_1 do
        L17_1 = AddTechniqueForPid
        L18_1 = L0_1
        L19_1 = L15_1
        L17_1(L18_1, L19_1)
        L2_1 = true
      end
    end
    L12_1 = TrackPidAndTechniqueBM
    L13_1 = L9_1.ppid
    L14_1 = "tt_to_child"
    L15_1 = "tt_to_child"
    L12_1(L13_1, L14_1, L15_1)
  end
end
::lbl_118::
if L2_1 then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = L0_1
  L5_1 = "has_inherited_tt"
  L6_1 = "has_inherited_tt"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
