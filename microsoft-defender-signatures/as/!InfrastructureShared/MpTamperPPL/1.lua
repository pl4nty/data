local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
L1_1 = {}
L1_1["hkcu\\software\\classes\\typelib\\{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}"] = true
L1_1["hkcu\\software\\classes\\wow6432node\\typelib\\{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}"] = true
L1_1["hkcu\\software\\classes\\typelib\\{57dacae6-5313-4e27-b109-e6e3d415730c}"] = true
L1_1["hkcu\\software\\classes\\wow6432node\\typelib\\{57dacae6-5313-4e27-b109-e6e3d415730c}"] = true
L1_1["hkcu\\software\\classes\\typelib\\{a87f050d-3ffd-4682-8e77-34e530624cb4}"] = true
L1_1["hkcu\\software\\classes\\wow6432node\\typelib\\{a87f050d-3ffd-4682-8e77-34e530624cb4}"] = true
L1_1["hkcu\\software\\classes\\typelib\\{c0653e9c-db3b-4e9e-b3ab-b8e1df53972f}"] = true
L1_1["hkcu\\software\\classes\\wow6432node\\typelib\\{c0653e9c-db3b-4e9e-b3ab-b8e1df53972f}"] = true
L1_1["hkcu\\software\\classes\\typelib\\{7071ec00-663b-4bc1-a1fa-b97f3b917c55}"] = true
L1_1["hkcu\\software\\classes\\wow6432node\\typelib\\{7071ec00-663b-4bc1-a1fa-b97f3b917c55}"] = true
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "MpTamperPPL.B"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.RegExpandUserKey
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    L8_1 = pairs
    L9_1 = L7_1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    for L11_1, L12_1 in L8_1, L9_1, L10_1 do
      L13_1 = sysio
      L13_1 = L13_1.RegOpenKey
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if L13_1 ~= nil then
        L14_1 = pcall
        L15_1 = sysio
        L15_1 = L15_1.DeleteRegKey
        L16_1 = L13_1
        L17_1 = ""
        L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
        if not L14_1 then
          L16_1 = pcall
          L17_1 = Remediation
          L17_1 = L17_1.BtrDeleteRegKey
          L18_1 = L12_1
          L16_1 = L16_1(L17_1, L18_1)
          L14_1 = L16_1
        end
      end
    end
  end
end
