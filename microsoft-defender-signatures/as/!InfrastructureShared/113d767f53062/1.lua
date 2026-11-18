-- Threat: !InfrastructureShared
-- Name: 113d767f53062
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = l_0_0.ppid
local l_0_2 = {}
while l_0_0 and l_0_0.image_path do
  local l_0_3 = l_0_0.image_path:match("([^\\]+)$")
  table.insert(l_0_2, l_0_3)
  l_0_0 = mp.GetParentProcInfo(l_0_0.ppid)
end
local l_0_4 = {}
local l_0_5 = GetRollingQueueKeys("NewlyRegisteredServices")
if l_0_5 and next(l_0_5) then
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if contains(l_0_7, l_0_2) then
      l_0_4.RegisteredSrv = l_0_7
      break
    end
  end
end
local l_0_8 = reportRelevantUntrustedEntitiesForPid(l_0_1)
if l_0_8 and next(l_0_8) then
  l_0_4.HasUntrustedEntities = true
  l_0_4.UntrustedEntities = l_0_8
end
if next(l_0_4) then
  set_research_data("AdditionalInfo", MpCommon.Base64Encode(safeJsonSerialize(l_0_4)), false)
end
return mp.INFECTED
