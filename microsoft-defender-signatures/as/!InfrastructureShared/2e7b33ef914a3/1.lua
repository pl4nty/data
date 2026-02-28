local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = L0_1
    L0_1 = L0_1.lower
    L0_1 = L0_1(L1_1)
    L1_1 = #L0_1
    if L1_1 < 10 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.ContextualExpandEnvironmentVariables
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1
    L1_1 = L1_1.gsub
    L3_1 = "%s+$"
    L4_1 = ""
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    L0_1 = L1_1
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L0_1
    L4_1 = "([%w%-_]+%.exe)"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = bm
    L3_1 = L3_1.get_process_relationships
    L3_1, L4_1 = L3_1()
    L5_1 = ipairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = mp
      L10_1 = L10_1.bitand
      L11_1 = L9_1.reason_ex
      L12_1 = bm
      L12_1 = L12_1.RELATIONSHIP_CREATED
      L10_1 = L10_1(L11_1, L12_1)
      L11_1 = bm
      L11_1 = L11_1.RELATIONSHIP_CREATED
      if L10_1 == L11_1 then
        L11_1 = string
        L11_1 = L11_1.lower
        L12_1 = L9_1.cmd_line
        L11_1 = L11_1(L12_1)
        L12_1 = string
        L12_1 = L12_1.match
        L13_1 = L11_1
        L14_1 = "([%w%-_]+%.exe)"
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 and L12_1 == L2_1 then
          L13_1 = bm
          L13_1 = L13_1.trigger_sig
          L14_1 = "StartedViatypedpaths.gen"
          L15_1 = "StartedViatypedpaths.gen"
          L16_1 = L9_1.ppid
          L13_1(L14_1, L15_1, L16_1)
          L13_1 = mp
          L13_1 = L13_1.INFECTED
          return L13_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
