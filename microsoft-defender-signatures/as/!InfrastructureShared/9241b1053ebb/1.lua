-- Threat: !InfrastructureShared
-- Name: 9241b1053ebb
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if versioning.GetTestMode() ~= 65000 and versioning.GetCloudBlockLevel() < 4 and versioning.IsSampled(1000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[3].np1
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = mp.bitand(l_0_0, 65535)
local l_0_1 = this_sigattrlog[5].utf8p1
local l_0_2 = 1
if not l_0_1:match("[%w%-%.]*%.[%w%-]+%.[%w]+") then
  return mp.CLEAN
end
local l_0_3 = lastIndexOf(l_0_1, ".", #l_0_1 - 7)
local l_0_4 = string.lower(string.sub(l_0_1, l_0_3 + 1))
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_4 .. "_" .. l_0_2
local l_0_6 = "NRI-DNS-EXF-A"
local l_0_7 = string.format("%s_%s_%s", l_0_6, l_0_4, l_0_2)
local l_0_8 = MpCommon.GetPersistContextCountNoPath(l_0_7)
if l_0_8 and 0 < l_0_8 then
  return mp.CLEAN
end
local l_0_9, l_0_10 = mp.CheckUrl(l_0_4)
if l_0_9 == 1 and l_0_10 == 1 then
  return mp.CLEAN
end
local l_0_11 = string.sub(l_0_1, 1, l_0_3 - 1)
if versioning.GetTestMode() ~= 6500 then
  local l_0_12, l_0_13, l_0_14, l_0_15 = computeStringScores(l_0_11)
  if (not (0 < l_0_13) or not (1 < l_0_12)) and not (3 < l_0_15) and not (5 < l_0_14) then
    return mp.CLEAN
  end
end
local l_0_16 = MpCommon.GetPersistContextCountNoPath(l_0_5)
if l_0_16 < 20 then
  local l_0_17 = MpCommon.QueryPersistContextNoPath(l_0_5, l_0_11)
  if not l_0_17 then
    local l_0_18 = computeReponseLength(l_0_0)
    MpCommon.AppendPersistContextNoPath(l_0_5, l_0_11, 3600)
    MpCommon.AppendPersistContextNoPath(l_0_5 .. "T", MpCommon.GetCurrentTimeT() .. "_" .. #l_0_11 .. "_" .. l_0_18, 3600)
    l_0_16 = l_0_16 + 1
  end
end
if 20 <= l_0_16 then
  local l_0_19 = MpCommon.GetPersistContextNoPath(l_0_5)
  local l_0_20, l_0_21 = extractCommonSuffix(l_0_19, 0)
  local l_0_22 = computeDataLength(l_0_19, #l_0_21)
  local l_0_23 = #l_0_21 + l_0_22
  if l_0_23 < 40 or l_0_22 < 20 then
    mp.changedetectionname(805306720)
  else
    local l_0_24 = this_sigattrlog[2].utf8p1
    local l_0_25 = routeBasedOnProcess(l_0_24, 0)
    mp.changedetectionname(l_0_25)
  end
  if not MpCommon.QueryPersistContextNoPath(l_0_6, l_0_5) then
    MpCommon.AppendPersistContextNoPath(l_0_6, l_0_5, 60)
  end
  return mp.INFECTED
end
return mp.CLEAN
