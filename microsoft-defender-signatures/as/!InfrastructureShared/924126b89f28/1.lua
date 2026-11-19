-- Threat: !InfrastructureShared
-- Name: 924126b89f28
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if versioning.GetTestMode() ~= 65000 and versioning.GetCloudBlockLevel() < 4 and versioning.IsSampled(10000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[5].utf8p1
local l_0_1 = 16
if not l_0_0:match("[%w%-%.]*%.[%w%-]+%.[%w]+") then
  return mp.CLEAN
end
local l_0_2 = lastIndexOf(l_0_0, ".", #l_0_0 - 7)
local l_0_3 = string.lower(string.sub(l_0_0, l_0_2 + 1))
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "NRI-DNS-TL-TXT"
local l_0_5 = string.format("%s_%s_%s", l_0_4, l_0_3, l_0_1)
local l_0_6 = l_0_3 .. "_" .. l_0_1
local l_0_7 = MpCommon.GetPersistContextCountNoPath(l_0_5)
if l_0_7 and 0 < l_0_7 then
  return mp.CLEAN
end
local l_0_8, l_0_9 = mp.CheckUrl(l_0_3)
local l_0_10 = this_sigattrlog[3].np1
if not l_0_10 then
  return mp.CLEAN
end
l_0_10 = mp.bitand(l_0_10, 65535)
if l_0_8 == 1 and l_0_9 == 1 then
  return mp.CLEAN
end
local l_0_11 = string.sub(l_0_0, 1, l_0_2 - 1)
if versioning.GetTestMode() ~= 65000 then
  local l_0_12, l_0_13, l_0_14, l_0_15 = computeStringScores(l_0_11)
  if (not (0 < l_0_13) or not (1 < l_0_12)) and not (3 < l_0_15) and not (5 < l_0_14) then
    return mp.CLEAN
  end
end
local l_0_16 = MpCommon.GetPersistContextCountNoPath(l_0_6)
if l_0_16 < 5 then
  local l_0_17 = MpCommon.QueryPersistContextNoPath(l_0_6, l_0_11)
  if not l_0_17 then
    local l_0_18 = computeReponseLength(l_0_10)
    MpCommon.AppendPersistContextNoPath(l_0_6, l_0_11, 3600)
    MpCommon.AppendPersistContextNoPath(l_0_6 .. "T", MpCommon.GetCurrentTimeT() .. "_" .. #l_0_11 .. "_" .. l_0_18, 3600)
    l_0_16 = l_0_16 + 1
  end
end
if 5 <= l_0_16 then
  local l_0_19 = MpCommon.GetPersistContextNoPath(l_0_6)
  local l_0_20, l_0_21 = extractCommonSuffix(l_0_19, 0)
  local l_0_22 = computeDataLength(l_0_19, #l_0_21)
  local l_0_23 = #l_0_21 + l_0_22
  if l_0_23 < 15 or l_0_22 < 10 then
    mp.changedetectionname(805306728)
  else
    local l_0_24 = this_sigattrlog[2].utf8p1
    local l_0_25
    if 500 < l_0_23 then
      l_0_25 = routeBasedOnProcess(l_0_24, 4)
    else
      l_0_25 = routeBasedOnProcess(l_0_24, 2)
    end
    mp.changedetectionname(l_0_25)
  end
  if isTrustedDomain(l_0_3, "DNS-sinkhole") then
    MpCommon.AppendPersistContextNoPath(l_0_5, "1", 3600)
    return mp.CLEAN
  end
  if not MpCommon.QueryPersistContextNoPath(l_0_4, l_0_6) then
    MpCommon.AppendPersistContextNoPath(l_0_4, l_0_6, 60)
  end
  return mp.INFECTED
end
return mp.CLEAN
