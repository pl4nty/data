local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "%->%(msg%)"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = {}
  L2_1 = "ALF:Exploit:O97M/"
  L3_1 = "SLF:Exploit:O97M/"
  L4_1 = "ALF:SCRIPT:O97M"
  L5_1 = "SLF:Trojan:O97M"
  L6_1 = "ALF:Trojan:O97M/"
  L7_1 = "Lowfi:Exploit:O97M"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L2_1 = 0
  L3_1 = pairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = mp
    L8_1 = L8_1.enum_mpattributesubstring
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 ~= nil then
      L9_1 = type
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 == "table" then
        L9_1 = #L8_1
        L2_1 = L2_1 + L9_1
        if 3 <= L2_1 then
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
  L3_1 = {}
  L4_1 = "TEL:Exploit:O97M"
  L5_1 = "SCPT:Exploit:O97"
  L6_1 = "TEL:Exploit:RTF"
  L7_1 = "TEL:Lowfi:Exploit:O97M"
  L8_1 = "SCRIPT:CVE-"
  L9_1 = "SCPT:Ploty.CVE-"
  L10_1 = "SCPT:RTF/CVE-"
  L11_1 = "SCPT:TrojanDownloader:O97M"
  L12_1 = "Exploit:O97M"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L3_1[7] = L10_1
  L3_1[8] = L11_1
  L3_1[9] = L12_1
  L4_1 = 0
  L5_1 = pairs
  L6_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = mp
    L10_1 = L10_1.enum_mpattributesubstring
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 ~= nil then
      L11_1 = type
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if L11_1 == "table" then
        L11_1 = #L10_1
        L4_1 = L11_1 + L4_1
        if L2_1 == 1 and 4 <= L4_1 then
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
