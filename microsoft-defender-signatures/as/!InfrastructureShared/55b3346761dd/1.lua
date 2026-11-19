-- Threat: !InfrastructureShared
-- Name: 55b3346761dd
-- Type: 21

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") ~= true then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(MpCommon.PathToWin32Path(l_0_0), true, true) == true then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_0, "RansomExtensionParentBlock") then
  return mp.INFECTED
end
if not MpCommon.QueryPersistContext(l_0_0, "RansomExtensionParent") then
  return mp.CLEAN
end
local l_0_1 = -1
local l_0_2 = -1
local l_0_3 = MpCommon.GetPersistContext(l_0_0)
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
  return mp.INFECTED
end
return mp.CLEAN
