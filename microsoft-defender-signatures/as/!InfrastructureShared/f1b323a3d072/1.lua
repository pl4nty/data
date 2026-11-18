-- Threat: !InfrastructureShared
-- Name: f1b323a3d072
-- Type: 21

local l_0_0 = bm.get_imagepath()
if MpCommon.QueryPersistContext(l_0_0, "RunsDestructiveCMDsParentBlock") then
  if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") == true then
    return mp.INFECTED
  else
    mp.ReportLowfi(l_0_0, 3371538283)
    return mp.CLEAN
  end
end
if not MpCommon.QueryPersistContext(l_0_0, "RunsDestructiveCMDsParent") then
  return mp.CLEAN
end
local l_0_1 = -1
local l_0_2 = -1
local l_0_3 = MpCommon.GetPersistContext(string.lower(l_0_0))
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6 = tonumber(string.match(l_0_5, "^Age:([0-9]+)$"))
    if l_0_6 ~= nil and l_0_1 < l_0_6 then
      l_0_1 = l_0_6
    end
    local l_0_7 = tonumber(string.match(l_0_5, "^Prevalence:([0-9]+)$"))
    if l_0_7 ~= nil and l_0_2 < l_0_7 then
      l_0_2 = l_0_7
    end
  end
end
if -1 < l_0_1 and l_0_1 <= 1 and -1 < l_0_2 and l_0_2 <= 100 then
  if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") == true then
    return mp.INFECTED
  else
    mp.ReportLowfi(l_0_0, 3371538283)
    return mp.CLEAN
  end
end
return mp.CLEAN
