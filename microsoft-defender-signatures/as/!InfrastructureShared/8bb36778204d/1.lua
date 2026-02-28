local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.utf8p1
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = ";apkg:ntlm;tsid:s-1-5-21-"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 then
        L3_1 = L0_1
        L2_1 = L0_1.match
        L4_1 = "ip:(.+)"
        L2_1 = L2_1(L3_1, L4_1)
        L3_1 = scrubData
        L5_1 = L1_1
        L4_1 = L1_1.match
        L6_1 = "tsid:([^;]+)"
        L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1, L6_1)
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
        L4_1 = scrubData
        L6_1 = L1_1
        L5_1 = L1_1.match
        L7_1 = "tn:([^;]+)"
        L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1, L7_1)
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
        L5_1 = scrubData
        L7_1 = L1_1
        L6_1 = L1_1.match
        L8_1 = "tdn:([^;]+)"
        L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L6_1(L7_1, L8_1)
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
        L6_1 = "tsid:PII_"
        L7_1 = L3_1
        L8_1 = ";tn:PII_"
        L9_1 = L4_1
        L10_1 = ";tdn:PII_"
        L11_1 = L5_1
        L1_1 = L6_1 .. L7_1 .. L8_1 .. L9_1 .. L10_1 .. L11_1
        L6_1 = AppendToRollingQueue
        L7_1 = "has_networklogonsuccess"
        L8_1 = L2_1
        L9_1 = L1_1
        L10_1 = 15
        L6_1(L7_1, L8_1, L9_1, L10_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
