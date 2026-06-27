-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_skill_md\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!skill.md") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_skill_md"
local l_0_4 = (string.lower)("ai_skill_md_" .. l_0_1)
local l_0_5 = 86400
local l_0_6 = (mp.getfilesize)()
if l_0_6 < 10 then
  return mp.CLEAN
end
if l_0_6 > 4096 then
  l_0_6 = 4096
end
;
(mp.readprotection)(false)
local l_0_7 = tostring((mp.readfile)(0, l_0_6))
;
(mp.readprotection)(true)
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
-- DECOMPILER ERROR at PC124: Unhandled construct in 'MakeBoolean' P3

if ((not l_0_9:match("^%s*(.-)%s*$") and l_0_10 and l_0_10:match("^%s*(.-)%s*$")) or l_0_11) then
  local l_0_12 = l_0_1:match("^(.+[\\/])")
  local l_0_13 = false
  l_0_13 = not l_0_12 or (sysio.IsFolderExists)(l_0_12 .. "scripts") or false
  local l_0_14 = {}
  l_0_14.name = l_0_9
  l_0_14.description = l_0_10
  l_0_14.version = l_0_11
  l_0_14.hasScripts = l_0_13
  l_0_14.file = l_0_1
  if isnull(l_0_14) then
    return mp.CLEAN
  end
  local l_0_15 = safeJsonSerialize(l_0_14)
  local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
  if l_0_16 and l_0_17 ~= nil then
    for l_0_21,l_0_22 in pairs(l_0_17) do
      if l_0_21 == l_0_4 and l_0_22 == l_0_15 then
        return mp.CLEAN
      end
    end
  end
  do
    AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_15, l_0_5, 100)
    local l_0_23 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_23 then
      (MpCommon.BmTriggerSig)(l_0_23, "AIDiscovery_skill_md", l_0_15)
    end
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
end

