-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_skill_md
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: (Lua:MDExt & RPF:TopLevelFile)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!skill.md") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_skill_md"
local l_0_4 = string.lower("ai_skill_md_" .. l_0_1)
local l_0_5 = 86400
local l_0_6 = mp.getfilesize()
if l_0_6 < 10 then
  return mp.CLEAN
end
if 4096 < l_0_6 then
  l_0_6 = 4096
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = l_0_7:match("^%-%-%-[\r\n](.-)[\r\n]%-%-%-")
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = l_0_8:match("name:%s*(.-)[\r\n]")
local l_0_10 = l_0_8:match("description:%s*(.-)[\r\n]")
local l_0_11 = l_0_8:match("version:%s*(.-)[\r\n]")
if not l_0_9 then
  return mp.CLEAN
end
l_0_9 = l_0_9:match("^%s*(.-)%s*$") or l_0_9
l_0_10 = l_0_10 and l_0_10:match("^%s*(.-)%s*$") or l_0_10
l_0_11 = l_0_11 and l_0_11:match("^%s*(.-)%s*$") or l_0_11
local l_0_12 = l_0_1:match("^(.+[\\/])")
local l_0_13 = false
if l_0_12 then
  l_0_13 = sysio.IsFolderExists(l_0_12 .. "scripts") or false
end
local l_0_14 = {
  name = l_0_9,
  description = l_0_10,
  version = l_0_11,
  hasScripts = l_0_13,
  file = l_0_1
}
if isnull(l_0_14) then
  return mp.CLEAN
end
local l_0_15 = safeJsonSerialize(l_0_14)
local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_16 and l_0_17 ~= nil then
  for l_0_18, l_0_19 in pairs(l_0_17) do
    if l_0_18 == l_0_4 and l_0_19 == l_0_15 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_15, l_0_5, 100)
local l_0_20 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_20 then
  MpCommon.BmTriggerSig(l_0_20, "AIDiscovery_skill_md", l_0_15)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
