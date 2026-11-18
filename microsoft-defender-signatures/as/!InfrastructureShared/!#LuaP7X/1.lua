-- Threat: !InfrastructureShared
-- Name: !#Lua:P7X
-- Type: 13
-- MpAttributes: BM_APPX_P7X

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 < 1 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 3
local l_0_5 = 3
local l_0_6 = 3

local function l_0_7(l_1_0)
  if not l_1_0 then
    return
  end
  l_1_0 = l_1_0:gsub(" ", "")
  if 50 < #l_1_0 then
    return
  end
  if mp.get_mpattribute(l_1_0) then
    return
  end
  mp.set_mpattribute(l_1_0)
  return
end

local function l_0_8(l_2_0, l_2_1)
  local l_2_2 = 6
  if l_2_1 and type(l_2_1) == "number" then
    l_2_2 = l_2_1
  end
  if not l_2_0 then
    return nil
  end
  if l_2_2 > #l_2_0 then
    l_2_2 = #l_2_0
  end
  return l_2_0:gsub(" ", ""):sub(1, l_2_2)
end

local function l_0_9(l_3_0)
  return string.format("%x", crypto.CRC32Buffer(-1, l_3_0, 0, #l_3_0))
end

local function l_0_10(l_4_0)
  if not l_4_0 then
    return nil
  end
  if not l_4_0.Hash then
    return nil
  end
  local l_4_1 = l_4_0.Hash
  return l_0_9(l_4_1)
end

local function l_0_11(l_5_0)
  if not l_5_0 then
    return nil
  end
  local l_5_1, l_5_2, l_5_3, l_5_4, l_5_5, l_5_6, l_5_7, l_5_8, l_5_9, l_5_10
  if l_5_0.Country then
    l_5_1 = mp.utf16to8(l_5_0.Country)
    l_5_2 = l_0_9(l_5_1)
  end
  if l_5_0.State then
    l_5_3 = mp.utf16to8(l_5_0.State)
    l_5_4 = l_0_9(l_5_3)
  end
  if l_5_0.Locality then
    l_5_5 = mp.utf16to8(l_5_0.Locality)
    l_5_6 = l_0_9(l_5_5)
  end
  if l_5_0.Organization then
    l_5_7 = mp.utf16to8(l_5_0.Organization)
    l_5_8 = l_0_9(l_5_7)
  end
  if l_5_0.CommonName then
    l_5_9 = mp.utf16to8(l_5_0.CommonName)
    l_5_10 = l_0_9(l_5_9)
  end
  return {
    Country = l_5_1,
    CountryCRC32 = l_5_2,
    State = l_5_3,
    StateCRC32 = l_5_4,
    Locality = l_5_5,
    LocalityCRC32 = l_5_6,
    Organization = l_5_7,
    OrganizationCRC32 = l_5_8,
    CommonName = l_5_9,
    CommonNameCRC32 = l_5_10
  }
end

for l_0_12, l_0_13 in ipairs(l_0_0) do
  if l_0_13.AuthenticodeContentType == "APPX" then
    if l_0_1 == l_0_4 then
      break
    end
    for l_0_14, l_0_15 in ipairs(l_0_13.Certificates) do
      if l_0_2 < l_0_5 then
        local l_0_16
        if l_0_15.FingerprintSha1 then
          l_0_16 = l_0_15.FingerprintSha1
        elseif l_0_15.FingerprintSha256 then
          l_0_16 = l_0_15.FingerprintSha256
        else
          return mp.CLEAN
        end
        local l_0_17 = l_0_10(l_0_16)
        if not l_0_17 then
          return mp.CLEAN
        end
        local l_0_18
        if l_0_15.Issuer then
          l_0_18 = l_0_15.Issuer
        elseif l_0_15.Subject then
          l_0_18 = l_0_15.Subject
        else
          return mp.CLEAN
        end
        local l_0_19 = l_0_11(l_0_18)
        if not l_0_19 then
          return mp.CLEAN
        end
        local l_0_20 = "Lua:P7X:Cert:"
        local l_0_21 = l_0_20 .. "FGPT:" .. l_0_8(l_0_17, 8)
        l_0_7(l_0_21)
        if l_0_19.Country then
          local l_0_22 = l_0_20 .. "CTRY:" .. l_0_8(l_0_19.Country, 2)
          local l_0_23 = l_0_20 .. "CTRY:" .. l_0_8(l_0_19.CountryCRC32, 8)
          l_0_7(l_0_22)
          l_0_7(l_0_23)
        end
        if l_0_19.Organization then
          local l_0_24 = l_0_20 .. "ORG:" .. l_0_8(l_0_19.Organization, 8)
          local l_0_25 = l_0_20 .. "ORG:" .. l_0_8(l_0_19.OrganizationCRC32, 8)
          l_0_7(l_0_24)
          l_0_7(l_0_25)
        end
        if l_0_19.CommonName then
          local l_0_26 = l_0_20 .. "CN:" .. l_0_8(l_0_19.CommonName, 8)
          local l_0_27 = l_0_20 .. "CN:" .. l_0_8(l_0_19.CommonNameCRC32, 8)
          l_0_7(l_0_26)
          l_0_7(l_0_27)
        end
      end
      l_0_2 = l_0_2 + 1
    end
    for l_0_28, l_0_29 in ipairs(l_0_13.Signers) do
      if l_0_3 < l_0_6 then
        if not l_0_29.Fingerprint then
          return mp.CLEAN
        end
        local l_0_30 = l_0_10(l_0_29.Fingerprint)
        if not l_0_30 then
          return mp.CLEAN
        end
        local l_0_31 = "Lua:P7X:Sign:"
        local l_0_32 = l_0_31 .. "FGPT:" .. l_0_8(l_0_30, 8)
        l_0_7(l_0_32)
      end
      l_0_3 = l_0_3 + 1
    end
    l_0_1 = l_0_1 + 1
  end
end
l_0_7(string.format("Lua:P7X:SignedDataCount:%d", #l_0_0))
l_0_7(string.format("Lua:P7X:CertCount:%d", l_0_2))
l_0_7(string.format("Lua:P7X:SignerCount:%d", l_0_3))
return mp.CLEAN
