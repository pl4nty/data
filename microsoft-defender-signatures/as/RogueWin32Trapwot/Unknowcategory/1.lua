local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil and A1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.Fingerprint
    if L7_2 == nil then
      L8_2 = false
      return L8_2
    end
    L8_2 = L7_2.HashType
    if L8_2 ~= "SHA1" then
      L8_2 = false
      return L8_2
    end
    L8_2 = L7_2.Hash
    if L8_2 == nil then
      L9_2 = false
      return L9_2
    end
    L9_2 = A1_2[L8_2]
    if L9_2 then
      L9_2 = true
      return L9_2
    end
    break
  end
  L2_2 = false
  return L2_2
end

L1_1 = mp
L1_1 = L1_1.GetCertificateInfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1["\031> =*\139\240\211\197#\246tB\160\006W\131\160\179#"] = true
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.AuthenticodeContentType
  if L8_1 ~= "PE" then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = L0_1
  L9_1 = L7_1.Signers
  L10_1 = L2_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "RPF:PEHasIOAVURL"
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.get_mpattribute
      L9_1 = "RPF:TopLevelFile"
      L8_1 = L8_1(L9_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "Lua:Win32/TrapwotCert.A"
    L8_1(L9_1)
  end
  break
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
