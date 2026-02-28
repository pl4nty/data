local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.gsub
    L2_1 = L0_1
    L3_1 = "\""
    L4_1 = ""
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    L0_1 = L1_1
    L1_1 = string
    L1_1 = L1_1.gsub
    L2_1 = L0_1
    L3_1 = "%s+$"
    L4_1 = ""
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    L0_1 = L1_1
    L1_1 = sysio
    L1_1 = L1_1.IsFileExists
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.IsKnownFriendlyFile
      L2_1 = L0_1
      L3_1 = true
      L4_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 == false then
        L1_1 = AppendToRollingQueue
        L2_1 = "Rugmigen_Parent"
        L3_1 = L0_1
        L4_1 = 1
        L5_1 = 30
        L1_1(L2_1, L3_1, L4_1, L5_1)
        L1_1 = bm
        L1_1 = L1_1.add_threat_file
        L2_1 = L0_1
        L1_1(L2_1)
      else
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = L0_1
        L1_1 = L1_1(L2_1)
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "c:\\users\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "c:\\programdata\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "\\kmspico\\"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              goto lbl_94
            end
          end
        end
        L2_1 = AppendToRollingQueue
        L3_1 = "Rugmigen_Parent"
        L4_1 = L0_1
        L5_1 = 1
        L6_1 = 30
        L2_1(L3_1, L4_1, L5_1, L6_1)
        L2_1 = bm
        L2_1 = L2_1.add_threat_file
        L3_1 = L0_1
        L2_1(L3_1)
      end
    end
    ::lbl_94::
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
