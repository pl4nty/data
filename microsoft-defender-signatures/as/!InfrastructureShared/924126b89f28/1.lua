local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = versioning
L0_1 = L0_1.GetTestMode
L0_1 = L0_1()
if L0_1 ~= 65000 then
  L0_1 = versioning
  L0_1 = L0_1.GetCloudBlockLevel
  L0_1 = L0_1()
  if L0_1 < 4 then
    L0_1 = MpCommon
    L0_1 = L0_1.IsSampled
    L1_1 = 10000
    L2_1 = true
    L3_1 = true
    L4_1 = true
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
    if L0_1 == false then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.utf8p1
L1_1 = 16
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "[%w%-%.]*%.[%w%-]+%.[%w]+"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = lastIndexOf
L3_1 = L0_1
L4_1 = "."
L5_1 = #L0_1
L5_1 = L5_1 - 7
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L0_1
L6_1 = L2_1 + 1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "NRI-DNS-TL-TXT"
L5_1 = string
L5_1 = L5_1.format
L6_1 = "%s_%s_%s"
L7_1 = L4_1
L8_1 = L3_1
L9_1 = L1_1
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L6_1 = L3_1
L7_1 = "_"
L8_1 = L1_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCountNoPath
L8_1 = L5_1
L7_1 = L7_1(L8_1)
if L7_1 and 0 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CheckUrl
L9_1 = L3_1
L8_1, L9_1 = L8_1(L9_1)
L10_1 = this_sigattrlog
L10_1 = L10_1[3]
L10_1 = L10_1.np1
if not L10_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.bitand
L12_1 = L10_1
L13_1 = 65535
L11_1 = L11_1(L12_1, L13_1)
L10_1 = L11_1
if L8_1 == 1 and L9_1 == 1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = string
L11_1 = L11_1.sub
L12_1 = L0_1
L13_1 = 1
L14_1 = L2_1 - 1
L11_1 = L11_1(L12_1, L13_1, L14_1)
L12_1 = versioning
L12_1 = L12_1.GetTestMode
L12_1 = L12_1()
if L12_1 ~= 65000 then
  L12_1 = computeStringScores
  L13_1 = L11_1
  L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1)
  if (not (0 < L13_1) or not (1 < L12_1)) and not (3 < L15_1) and not (5 < L14_1) then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
end
L12_1 = MpCommon
L12_1 = L12_1.GetPersistContextCountNoPath
L13_1 = L6_1
L12_1 = L12_1(L13_1)
if L12_1 < 5 then
  L13_1 = MpCommon
  L13_1 = L13_1.QueryPersistContextNoPath
  L14_1 = L6_1
  L15_1 = L11_1
  L13_1 = L13_1(L14_1, L15_1)
  if not L13_1 then
    L14_1 = computeReponseLength
    L15_1 = L10_1
    L14_1 = L14_1(L15_1)
    L15_1 = MpCommon
    L15_1 = L15_1.AppendPersistContextNoPath
    L16_1 = L6_1
    L17_1 = L11_1
    L18_1 = 3600
    L15_1(L16_1, L17_1, L18_1)
    L15_1 = MpCommon
    L15_1 = L15_1.AppendPersistContextNoPath
    L16_1 = L6_1
    L17_1 = "T"
    L16_1 = L16_1 .. L17_1
    L17_1 = MpCommon
    L17_1 = L17_1.GetCurrentTimeT
    L17_1 = L17_1()
    L18_1 = "_"
    L19_1 = #L11_1
    L20_1 = "_"
    L21_1 = L14_1
    L17_1 = L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
    L18_1 = 3600
    L15_1(L16_1, L17_1, L18_1)
    L12_1 = L12_1 + 1
  end
end
if 5 <= L12_1 then
  L13_1 = MpCommon
  L13_1 = L13_1.GetPersistContextNoPath
  L14_1 = L6_1
  L13_1 = L13_1(L14_1)
  L14_1 = extractCommonSuffix
  L15_1 = L13_1
  L16_1 = 0
  L14_1, L15_1 = L14_1(L15_1, L16_1)
  L16_1 = computeDataLength
  L17_1 = L13_1
  L18_1 = #L15_1
  L16_1 = L16_1(L17_1, L18_1)
  L17_1 = #L15_1
  L17_1 = L17_1 + L16_1
  if L17_1 < 15 or L16_1 < 10 then
    L18_1 = mp
    L18_1 = L18_1.changedetectionname
    L19_1 = 805306728
    L18_1(L19_1)
  else
    L18_1 = this_sigattrlog
    L18_1 = L18_1[2]
    L18_1 = L18_1.utf8p1
    L19_1 = nil
    if 500 < L17_1 then
      L20_1 = routeBasedOnProcess
      L21_1 = L18_1
      L22_1 = 4
      L20_1 = L20_1(L21_1, L22_1)
      L19_1 = L20_1
    else
      L20_1 = routeBasedOnProcess
      L21_1 = L18_1
      L22_1 = 2
      L20_1 = L20_1(L21_1, L22_1)
      L19_1 = L20_1
    end
    L20_1 = mp
    L20_1 = L20_1.changedetectionname
    L21_1 = L19_1
    L20_1(L21_1)
  end
  L18_1 = isTrustedDomain
  L19_1 = L3_1
  L20_1 = "DNS-sinkhole"
  L18_1 = L18_1(L19_1, L20_1)
  if L18_1 then
    L18_1 = MpCommon
    L18_1 = L18_1.AppendPersistContextNoPath
    L19_1 = L5_1
    L20_1 = "1"
    L21_1 = 3600
    L18_1(L19_1, L20_1, L21_1)
    L18_1 = mp
    L18_1 = L18_1.CLEAN
    return L18_1
  end
  L18_1 = MpCommon
  L18_1 = L18_1.QueryPersistContextNoPath
  L19_1 = L4_1
  L20_1 = L6_1
  L18_1 = L18_1(L19_1, L20_1)
  if not L18_1 then
    L18_1 = MpCommon
    L18_1 = L18_1.AppendPersistContextNoPath
    L19_1 = L4_1
    L20_1 = L6_1
    L21_1 = 60
    L18_1(L19_1, L20_1, L21_1)
  end
  L18_1 = mp
  L18_1 = L18_1.INFECTED
  return L18_1
end
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
