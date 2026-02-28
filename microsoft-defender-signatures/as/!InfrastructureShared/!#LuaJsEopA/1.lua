local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = "ALF:Trojan:HTML/Phish"
L2_1 = "ALF:Trojan:HTML/Obfuse"
L3_1 = "ALF:Trojan:JS/Phish"
L4_1 = "ALF:EmailAddressInHtmlScript"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.enum_mpattributesubstring
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 ~= nil then
    L8_1 = type
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 == "table" then
      L8_1 = #L7_1
      L1_1 = L1_1 + L8_1
      if 3 <= L1_1 then
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L2_1 = {}
L3_1 = "SCRIPT:JS/JSObfuscator"
L4_1 = "SCPT:Trojan:HTML/Phish"
L5_1 = "SCPT:TrojanDownloader:HTML/Obfuse"
L6_1 = "SCRIPT:JS/DocWrite"
L7_1 = "SCRIPT:JS/CryptoJS"
L8_1 = "SCRIPT:HTML/Redirec"
L9_1 = "SCRIPT:JS/Eval"
L10_1 = "HtmlWithEmbedded"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L3_1 = 0
L4_1 = pairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = mp
  L9_1 = L9_1.enum_mpattributesubstring
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= nil then
    L10_1 = type
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 == "table" then
      L10_1 = #L9_1
      L3_1 = L10_1 + L3_1
      if L1_1 == 0 and 5 <= L3_1 then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      elseif 1 <= L1_1 and 4 <= L3_1 then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
