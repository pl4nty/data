-- Threat: !InfrastructureShared
-- Name: !#DestructiveCMD
-- Type: 13
-- Includes: AgePrevalence
-- MpAttributes: !BM_FileModByDestructiveCMDParent & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2 .. "\\" .. l_0_0
l_0_3 = string.lower(l_0_3)
if not MpCommon.QueryPersistContext(l_0_3, "RunsDestructiveCMDsParent") then
  return mp.CLEAN
end
mp.set_mpattribute("BM_FileModByDestructiveCMDParent")
if MpCommon.QueryPersistContext(l_0_3, "RunsDestructiveCMDsParentBlock") or MpCommon.QueryPersistContext(l_0_3, "RunsDestructiveCMDsParentStopLookup") then
  clearPersistContext(l_0_3, "disableCachingQueryAgePrev")
  return mp.CLEAN
end
local l_0_4 = -1
local l_0_5 = -1
local l_0_6 = MpCommon.GetPersistContext(l_0_3)
if l_0_6 ~= nil then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    local l_0_9 = tonumber(string.match(l_0_8, "^Age:([0-9]+)$"))
    if l_0_9 ~= nil and l_0_4 < l_0_9 then
      l_0_4 = l_0_9
    end
    local l_0_10 = tonumber(string.match(l_0_8, "^Prevalence:([0-9]+)$"))
    if l_0_10 ~= nil and l_0_5 < l_0_10 then
      l_0_5 = l_0_10
    end
  end
end
if -1 < l_0_4 and l_0_4 <= 1 and -1 < l_0_5 and l_0_5 <= 100 then
  if not MpCommon.QueryPersistContext(l_0_3, "RunsDestructiveCMDsParentBlock") then
    MpCommon.AppendPersistContext(l_0_3, "RunsDestructiveCMDsParentBlock", 0)
  end
  clearPersistContext(l_0_3, "disableCachingQueryAgePrev")
elseif 1 < l_0_4 or 100 < l_0_5 then
  if not MpCommon.QueryPersistContext(l_0_3, "RunsDestructiveCMDsParentStopLookup") then
    MpCommon.AppendPersistContext(l_0_3, "RunsDestructiveCMDsParentStopLookup", 0)
  end
  clearPersistContext(l_0_3, "disableCachingQueryAgePrev")
elseif not MpCommon.QueryPersistContext(l_0_3, "disableCachingQueryAgePrev") then
  MpCommon.AppendPersistContext(l_0_3, "disableCachingQueryAgePrev", 0)
end
return mp.CLEAN
