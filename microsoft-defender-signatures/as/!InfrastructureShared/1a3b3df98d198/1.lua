local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[5]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
end
L3_1 = next
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L3_1 = next
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L3_1 = next
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 ~= nil then
      L3_1 = nil
      L4_1 = nil
      L5_1 = nil
      L6_1 = #L0_1
      L3_1 = L0_1[L6_1]
      L6_1 = #L1_1
      L4_1 = L1_1[L6_1]
      L6_1 = #L2_1
      L5_1 = L2_1[L6_1]
      if L3_1 ~= nil and L3_1 == L4_1 and L4_1 == L5_1 then
        L6_1 = bm
        L6_1 = L6_1.get_imagepath
        L6_1 = L6_1()
        if L6_1 ~= nil then
          L7_1 = string
          L7_1 = L7_1.match
          L8_1 = L6_1
          L9_1 = "/bin/%a*sh"
          L7_1 = L7_1(L8_1, L9_1)
          if not L7_1 then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = L6_1
            L9_1 = "perl"
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if not L7_1 then
              L7_1 = string
              L7_1 = L7_1.find
              L8_1 = L6_1
              L9_1 = "python"
              L10_1 = 1
              L11_1 = true
              L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
              if not L7_1 then
                goto lbl_128
              end
            end
          end
          L7_1 = bm
          L7_1 = L7_1.get_process_relationships
          L7_1, L8_1 = L7_1()
          L9_1 = ipairs
          L10_1 = L8_1
          L9_1, L10_1, L11_1 = L9_1(L10_1)
          for L12_1, L13_1 in L9_1, L10_1, L11_1 do
            L14_1 = bm
            L14_1 = L14_1.trigger_sig
            L15_1 = "BmTraverseTreeBlock"
            L16_1 = "Detected"
            L17_1 = L13_1.ppid
            L14_1(L15_1, L16_1, L17_1)
          end
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
::lbl_128::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
