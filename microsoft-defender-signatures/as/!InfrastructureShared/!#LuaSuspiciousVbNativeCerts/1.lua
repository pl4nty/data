local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.Certificates
  if L6_1 ~= nil then
    L7_1 = ipairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = L11_1.Issuer
      if L12_1 ~= nil then
        L13_1 = L12_1.Organization
        if L13_1 ~= nil then
          L13_1 = {}
          L13_1["Microsoft Corporation"] = true
          L13_1["ROBLOX Corporation"] = true
          L13_1["AddTrust AB"] = true
          L13_1["Adobe Systems Incorporated"] = true
          L13_1["Dell USA L.P."] = true
          L13_1["DigiCert Inc"] = true
          L13_1.DigiCert = true
          L13_1["VeriSign, Inc."] = true
          L13_1["VeriSign Trust Network"] = true
          L13_1["COMODO CA Limited"] = true
          L13_1.Thawte = true
          L13_1["Thawte Consulting (Pty) Ltd."] = true
          L13_1["Symantec Corporation"] = true
          L13_1["WIZVERA CO., LTD"] = true
          L13_1["NCH Software"] = true
          L13_1["win.rar GmbH"] = true
          L13_1.Interezen = true
          L13_1["Interezen Co.,Ltd"] = true
          L13_1["Interezen Co,.Ltd"] = true
          L13_1["Shenzhen Wondershare Information Technology Co., Ltd."] = true
          L13_1["Reloaded Games, Inc"] = true
          L14_1 = mp
          L14_1 = L14_1.utf16to8
          L15_1 = L12_1.Organization
          L14_1 = L14_1(L15_1)
          L14_1 = L13_1[L14_1]
          if L14_1 then
            L14_1 = mp
            L14_1 = L14_1.CLEAN
            return L14_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
