-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\113d767f53062\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1 = l_0_0.ppid
local l_0_2 = {}
do
  while l_0_0 and l_0_0.image_path do
    local l_0_3 = (l_0_0.image_path):match("([^\\]+)$")
    ;
    (table.insert)(l_0_2, l_0_3)
    l_0_0 = (mp.GetParentProcInfo)(l_0_0.ppid)
  end
  local l_0_4 = {}
  local l_0_5 = GetRollingQueueKeys("NewlyRegisteredServices")
  if l_0_5 and next(l_0_5) then
    for l_0_9,l_0_10 in ipairs(l_0_5) do
      if contains(l_0_10, l_0_2) then
        l_0_4.RegisteredSrv = l_0_10
        break
      end
    end
  end
  do
    local l_0_11 = reportRelevantUntrustedEntitiesForPid(l_0_1)
    if l_0_11 and next(l_0_11) then
      l_0_4.HasUntrustedEntities = true
      l_0_4.UntrustedEntities = l_0_11
    end
    if next(l_0_4) then
      set_research_data("AdditionalInfo", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_4)), false)
    end
    return mp.INFECTED
  end
end

