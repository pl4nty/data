-- Threat: !InfrastructureShared
-- Name: 15bb395c90cd7
-- Type: 21
-- Includes: Path, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil or #l_0_0 <= 8 then
  return mp.CLEAN
end
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
l_0_0 = l_0_0 and normalize_path(string.lower(l_0_0))
if l_0_0 == nil or #l_0_0 <= 8 then
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  if l_1_0:sub(1, 1) == "\"" and l_1_0:sub(-1) == "\"" then
    return l_1_0:sub(2, -2)
  end
  return l_1_0
end

l_0_0 = l_0_1(l_0_0)
if GetRollingQueueCountForKey(l_0_0, "software_deployment_tools_dropped_file") <= 0 then
  return mp.CLEAN
end
local l_0_2 = ""
if GetRollingQueueCountForKey(l_0_0, "BM:MsIntuneDeployment.A") >= 1 then
  l_0_2 = "BM:MsIntuneDeployment.A,"
end
if 1 <= GetRollingQueueCountForKey(l_0_0, "BM:MsIntuneDeployment.B") then
  l_0_2 = l_0_2 .. "BM:MsIntuneDeployment.B"
end
if l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = -1
local l_0_4 = -1
local l_0_5 = MpCommon.GetPersistContext(l_0_0)
if l_0_5 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    local l_0_8 = tonumber(string.match(l_0_7, "^Age:([0-9]+)$"))
    if l_0_8 ~= nil and l_0_3 < l_0_8 then
      l_0_3 = l_0_8
    end
    local l_0_9 = tonumber(string.match(l_0_7, "^Prevalence:([0-9]+)$"))
    if l_0_9 ~= nil and l_0_4 < l_0_9 then
      l_0_4 = l_0_9
    end
  end
end
bm.add_related_file(l_0_0)
local l_0_10 = string.format("TriggerBMSig=%s,FileAge=%s,FilePrev=%s", l_0_2, tostring(l_0_3), tostring(l_0_4))
bm.add_related_string("BmReferences", l_0_10, bm.RelatedStringBMReport)
return mp.INFECTED
