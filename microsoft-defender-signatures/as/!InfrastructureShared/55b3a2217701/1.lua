local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
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
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
    end
  end
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = "^(\\\\[^\\]+\\[^\\]+)"
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L6_1
    L8_1 = L8_1(L9_1)
    L6_1 = L8_1
    L8_1 = string
    L8_1 = L8_1.match
    L9_1 = L6_1
    L10_1 = L7_1
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L6_1
      L10_1 = "engagementschu.vbs"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L6_1
        L10_1 = "enginchu.vbs"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if not L8_1 then
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L6_1
          L10_1 = "pacs_launcher.vbs"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if not L8_1 then
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L6_1
            L10_1 = "fidelity"
            L11_1 = 1
            L12_1 = true
            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
            if not L8_1 then
              L8_1 = string
              L8_1 = L8_1.find
              L9_1 = L6_1
              L10_1 = "bginfo"
              L11_1 = 1
              L12_1 = true
              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
              if not L8_1 then
                L8_1 = string
                L8_1 = L8_1.find
                L9_1 = L6_1
                L10_1 = "favoris_explorer"
                L11_1 = 1
                L12_1 = true
                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                if not L8_1 then
                  goto lbl_108
                end
              end
            end
          end
        end
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    do return L8_1 end
    ::lbl_108::
  end
  L2_1 = nil
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L2_1 = L3_1.utf8p1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L2_1 then
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "hkcu\\software\\[^\\]+$"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      goto lbl_133
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_133::
  L4_1 = AppendToRollingQueue
  L5_1 = "big_reg_write"
  L6_1 = L3_1
  L7_1 = "found"
  L8_1 = 600
  L4_1(L5_1, L6_1, L7_1, L8_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
