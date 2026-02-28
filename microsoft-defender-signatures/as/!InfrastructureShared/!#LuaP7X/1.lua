local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = #L0_1
if L1_1 < 1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 0
L2_1 = 0
L3_1 = 0
L4_1 = 3
L5_1 = 3
L6_1 = 3

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    return
  end
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = " "
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = #A0_2
  if 50 < L1_2 then
    return
  end
  L1_2 = mp
  L1_2 = L1_2.get_mpattribute
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    return
  end
  L1_2 = mp
  L1_2 = L1_2.set_mpattribute
  L2_2 = A0_2
  L1_2(L2_2)
  return
end

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = 6
  if A1_2 then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "number" then
      L2_2 = A1_2
    end
  end
  if not A0_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = #A0_2
  if L2_2 > L3_2 then
    L2_2 = #A0_2
  end
  L4_2 = A0_2
  L3_2 = A0_2.gsub
  L5_2 = " "
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L3_2
  L3_2 = L3_2.sub
  L5_2 = 1
  L6_2 = L2_2
  return L3_2(L4_2, L5_2, L6_2)
end

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = "%x"
  L3_2 = crypto
  L3_2 = L3_2.CRC32Buffer
  L4_2 = -1
  L5_2 = A0_2
  L6_2 = 0
  L7_2 = #A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  return L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
end

function L10_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = A0_2.Hash
  if not L1_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = A0_2.Hash
  L2_2 = L9_1
  L3_2 = L1_2
  return L2_2(L3_2)
end

function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = A0_2.Country
  if L11_2 then
    L11_2 = mp
    L11_2 = L11_2.utf16to8
    L12_2 = A0_2.Country
    L11_2 = L11_2(L12_2)
    L1_2 = L11_2
    L11_2 = L9_1
    L12_2 = L1_2
    L11_2 = L11_2(L12_2)
    L2_2 = L11_2
  end
  L11_2 = A0_2.State
  if L11_2 then
    L11_2 = mp
    L11_2 = L11_2.utf16to8
    L12_2 = A0_2.State
    L11_2 = L11_2(L12_2)
    L3_2 = L11_2
    L11_2 = L9_1
    L12_2 = L3_2
    L11_2 = L11_2(L12_2)
    L4_2 = L11_2
  end
  L11_2 = A0_2.Locality
  if L11_2 then
    L11_2 = mp
    L11_2 = L11_2.utf16to8
    L12_2 = A0_2.Locality
    L11_2 = L11_2(L12_2)
    L5_2 = L11_2
    L11_2 = L9_1
    L12_2 = L5_2
    L11_2 = L11_2(L12_2)
    L6_2 = L11_2
  end
  L11_2 = A0_2.Organization
  if L11_2 then
    L11_2 = mp
    L11_2 = L11_2.utf16to8
    L12_2 = A0_2.Organization
    L11_2 = L11_2(L12_2)
    L7_2 = L11_2
    L11_2 = L9_1
    L12_2 = L7_2
    L11_2 = L11_2(L12_2)
    L8_2 = L11_2
  end
  L11_2 = A0_2.CommonName
  if L11_2 then
    L11_2 = mp
    L11_2 = L11_2.utf16to8
    L12_2 = A0_2.CommonName
    L11_2 = L11_2(L12_2)
    L9_2 = L11_2
    L11_2 = L9_1
    L12_2 = L9_2
    L11_2 = L11_2(L12_2)
    L10_2 = L11_2
  end
  L11_2 = {}
  L11_2.Country = L1_2
  L11_2.CountryCRC32 = L2_2
  L11_2.State = L3_2
  L11_2.StateCRC32 = L4_2
  L11_2.Locality = L5_2
  L11_2.LocalityCRC32 = L6_2
  L11_2.Organization = L7_2
  L11_2.OrganizationCRC32 = L8_2
  L11_2.CommonName = L9_2
  L11_2.CommonNameCRC32 = L10_2
  return L11_2
end

L12_1 = ipairs
L13_1 = L0_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = L16_1.AuthenticodeContentType
  if L17_1 == "APPX" then
    if L1_1 == L4_1 then
      break
    end
    L17_1 = ipairs
    L18_1 = L16_1.Certificates
    L17_1, L18_1, L19_1 = L17_1(L18_1)
    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
      if L2_1 < L5_1 then
        L22_1 = nil
        L23_1 = L21_1.FingerprintSha1
        if L23_1 then
          L22_1 = L21_1.FingerprintSha1
        else
          L23_1 = L21_1.FingerprintSha256
          if L23_1 then
            L22_1 = L21_1.FingerprintSha256
          else
            L23_1 = mp
            L23_1 = L23_1.CLEAN
            return L23_1
          end
        end
        L23_1 = L10_1
        L24_1 = L22_1
        L23_1 = L23_1(L24_1)
        if not L23_1 then
          L24_1 = mp
          L24_1 = L24_1.CLEAN
          return L24_1
        end
        L24_1 = nil
        L25_1 = L21_1.Issuer
        if L25_1 then
          L24_1 = L21_1.Issuer
        else
          L25_1 = L21_1.Subject
          if L25_1 then
            L24_1 = L21_1.Subject
          else
            L25_1 = mp
            L25_1 = L25_1.CLEAN
            return L25_1
          end
        end
        L25_1 = L11_1
        L26_1 = L24_1
        L25_1 = L25_1(L26_1)
        if not L25_1 then
          L26_1 = mp
          L26_1 = L26_1.CLEAN
          return L26_1
        end
        L26_1 = "Lua:P7X:Cert:"
        L27_1 = L26_1
        L28_1 = "FGPT:"
        L29_1 = L8_1
        L30_1 = L23_1
        L31_1 = 8
        L29_1 = L29_1(L30_1, L31_1)
        L27_1 = L27_1 .. L28_1 .. L29_1
        L28_1 = L7_1
        L29_1 = L27_1
        L28_1(L29_1)
        L28_1 = L25_1.Country
        if L28_1 then
          L28_1 = L26_1
          L29_1 = "CTRY:"
          L30_1 = L8_1
          L31_1 = L25_1.Country
          L32_1 = 2
          L30_1 = L30_1(L31_1, L32_1)
          L28_1 = L28_1 .. L29_1 .. L30_1
          L29_1 = L26_1
          L30_1 = "CTRY:"
          L31_1 = L8_1
          L32_1 = L25_1.CountryCRC32
          L33_1 = 8
          L31_1 = L31_1(L32_1, L33_1)
          L29_1 = L29_1 .. L30_1 .. L31_1
          L30_1 = L7_1
          L31_1 = L28_1
          L30_1(L31_1)
          L30_1 = L7_1
          L31_1 = L29_1
          L30_1(L31_1)
        end
        L28_1 = L25_1.Organization
        if L28_1 then
          L28_1 = L26_1
          L29_1 = "ORG:"
          L30_1 = L8_1
          L31_1 = L25_1.Organization
          L32_1 = 8
          L30_1 = L30_1(L31_1, L32_1)
          L28_1 = L28_1 .. L29_1 .. L30_1
          L29_1 = L26_1
          L30_1 = "ORG:"
          L31_1 = L8_1
          L32_1 = L25_1.OrganizationCRC32
          L33_1 = 8
          L31_1 = L31_1(L32_1, L33_1)
          L29_1 = L29_1 .. L30_1 .. L31_1
          L30_1 = L7_1
          L31_1 = L28_1
          L30_1(L31_1)
          L30_1 = L7_1
          L31_1 = L29_1
          L30_1(L31_1)
        end
        L28_1 = L25_1.CommonName
        if L28_1 then
          L28_1 = L26_1
          L29_1 = "CN:"
          L30_1 = L8_1
          L31_1 = L25_1.CommonName
          L32_1 = 8
          L30_1 = L30_1(L31_1, L32_1)
          L28_1 = L28_1 .. L29_1 .. L30_1
          L29_1 = L26_1
          L30_1 = "CN:"
          L31_1 = L8_1
          L32_1 = L25_1.CommonNameCRC32
          L33_1 = 8
          L31_1 = L31_1(L32_1, L33_1)
          L29_1 = L29_1 .. L30_1 .. L31_1
          L30_1 = L7_1
          L31_1 = L28_1
          L30_1(L31_1)
          L30_1 = L7_1
          L31_1 = L29_1
          L30_1(L31_1)
        end
      end
      L2_1 = L2_1 + 1
    end
    L17_1 = ipairs
    L18_1 = L16_1.Signers
    L17_1, L18_1, L19_1 = L17_1(L18_1)
    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
      if L3_1 < L6_1 then
        L22_1 = L21_1.Fingerprint
        if not L22_1 then
          L22_1 = mp
          L22_1 = L22_1.CLEAN
          return L22_1
        end
        L22_1 = L10_1
        L23_1 = L21_1.Fingerprint
        L22_1 = L22_1(L23_1)
        if not L22_1 then
          L23_1 = mp
          L23_1 = L23_1.CLEAN
          return L23_1
        end
        L23_1 = "Lua:P7X:Sign:"
        L24_1 = L23_1
        L25_1 = "FGPT:"
        L26_1 = L8_1
        L27_1 = L22_1
        L28_1 = 8
        L26_1 = L26_1(L27_1, L28_1)
        L24_1 = L24_1 .. L25_1 .. L26_1
        L25_1 = L7_1
        L26_1 = L24_1
        L25_1(L26_1)
      end
      L3_1 = L3_1 + 1
    end
    L1_1 = L1_1 + 1
  end
end
L12_1 = L7_1
L13_1 = string
L13_1 = L13_1.format
L14_1 = "Lua:P7X:SignedDataCount:%d"
L15_1 = #L0_1
L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1 = L13_1(L14_1, L15_1)
L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1)
L12_1 = L7_1
L13_1 = string
L13_1 = L13_1.format
L14_1 = "Lua:P7X:CertCount:%d"
L15_1 = L2_1
L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1 = L13_1(L14_1, L15_1)
L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1)
L12_1 = L7_1
L13_1 = string
L13_1 = L13_1.format
L14_1 = "Lua:P7X:SignerCount:%d"
L15_1 = L3_1
L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1 = L13_1(L14_1, L15_1)
L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1)
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
