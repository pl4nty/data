local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.GetExecutablesFromCommandLine
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.GetExecutablesFromCommandLine
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
L2_1 = next
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L2_1 = next
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L2_1 = nil
    L3_1 = nil
    L4_1 = #L0_1
    L2_1 = L0_1[L4_1]
    L4_1 = #L1_1
    L3_1 = L1_1[L4_1]
    if L2_1 ~= nil and L2_1 == L3_1 then
      L4_1 = bm
      L4_1 = L4_1.get_imagepath
      L4_1 = L4_1()
      if L4_1 ~= nil then
        L5_1 = string
        L5_1 = L5_1.match
        L6_1 = L4_1
        L7_1 = "/bin/%a*sh"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = "perl"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "python"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              goto lbl_102
            end
          end
        end
        L5_1 = bm
        L5_1 = L5_1.get_process_relationships
        L5_1, L6_1 = L5_1()
        L7_1 = ipairs
        L8_1 = L6_1
        L7_1, L8_1, L9_1 = L7_1(L8_1)
        for L10_1, L11_1 in L7_1, L8_1, L9_1 do
          L12_1 = bm
          L12_1 = L12_1.trigger_sig
          L13_1 = "BmTraverseTreeBlock"
          L14_1 = "Detected"
          L15_1 = L11_1.ppid
          L12_1(L13_1, L14_1, L15_1)
        end
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
::lbl_102::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
