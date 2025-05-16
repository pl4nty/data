-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\61d70a006009\0x00001100_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = (string.lower)(l_1_0.image_path)
  local l_1_2 = l_1_1:match("([^\\]+)$")
  local l_1_3 = false
  l_1_3 = (MpCommon.StringRegExpSearch)("(wttsvc|teamviewer)", l_1_2)
  if l_1_3 == true then
    return true
  end
  return false
end

local l_0_1 = (mp.GetParentProcInfo)()
local l_0_2 = l_0_1.ppid
local l_0_3 = {}
do
  while l_0_1 and l_0_1.image_path do
    local l_0_4 = (l_0_1.image_path):match("([^\\]+)$")
    ;
    (table.insert)(l_0_3, l_0_4)
    if l_0_0(l_0_1) then
      return mp.CLEAN
    end
    l_0_1 = (mp.GetParentProcInfo)(l_0_1.ppid)
  end
  local l_0_5 = {}
  local l_0_6 = GetRollingQueueKeys("NewlyRegisteredServices")
  if l_0_6 and next(l_0_6) then
    for l_0_10,l_0_11 in ipairs(l_0_6) do
      if contains(l_0_11, l_0_3) then
        l_0_5.RegisteredSrv = l_0_11
        break
      end
    end
  end
  do
    local l_0_12 = reportRelevantUntrustedEntitiesForPid(l_0_2)
    if l_0_12 and next(l_0_12) then
      l_0_5.HasUntrustedEntities = true
      l_0_5.UntrustedEntities = l_0_12
    end
    local l_0_13 = "TamperingTracking"
    local l_0_14 = GetRollingQueueSumOfValues(l_0_13)
    do
      if l_0_14 and l_0_14.sum > 0 then
        local l_0_15 = GetRollingQueue(l_0_13)
        l_0_5.TamperingEvents = l_0_15
        l_0_5.TamperingWeight = l_0_14.sum
      end
      if next(l_0_5) then
        set_research_data("AdditionalInfo", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_5)), false)
      end
      return mp.INFECTED
    end
  end
end

