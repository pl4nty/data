local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 197
L1_1 = 133
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
L3_1 = pehdr
L3_1 = L3_1.DataDirectory
L4_1 = pe
L4_1 = L4_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L3_1 = L3_1[L4_1]
L3_1 = L3_1.RVA
L4_1 = pehdr
L4_1 = L4_1.DataDirectory
L5_1 = pe
L5_1 = L5_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L4_1 = L4_1[L5_1]
L4_1 = L4_1.Size
if L3_1 ~= 0 then
  L5_1 = L0_1 + L1_1
  if not (L4_1 < L5_1) and not (L2_1 <= L3_1) then
    L5_1 = L2_1 - L3_1
    if not (L4_1 > L5_1) then
      goto lbl_31
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_31::
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L3_1 + L0_1
L7_1 = L1_1
L5_1 = L5_1(L6_1, L7_1)
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "Sectigo"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Issuer.Sectigo"
  L6_1(L7_1)
end
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "thawte"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Issuer.thawte"
  L6_1(L7_1)
end
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "COMODO"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Issuer.COMODO"
  L6_1(L7_1)
end
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "Microsoft"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Issuer.Microsoft"
  L6_1(L7_1)
end
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "DigiCert"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Issuer.DigiCert"
  L6_1(L7_1)
end
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = true
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
