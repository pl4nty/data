-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_grokbuild_toml\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (not (mp.get_mpattribute)("Lua:FnameAttr!config.toml") and not (mp.get_mpattribute)("Lua:FnameAttr!managed_config.toml") and not (mp.get_mpattribute)("Lua:FnameAttr!requirements.toml")) or not (mp.get_mpattribute)("Lua:LastFolder0!.grok") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilesize)()
if type(l_0_2) ~= "number" or l_0_2 < 0 or l_0_2 > 1024000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = (mp.readfile)(0, l_0_2)
;
(mp.readprotection)(true)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = pcall(MpCommon.TomlDeserialize, tostring(l_0_3))
if not l_0_4 or type(l_0_5) ~= "table" or type(l_0_5.mcp_servers) ~= "table" then
  return mp.CLEAN
end
local l_0_6 = {}
for l_0_10,l_0_11 in pairs(l_0_5.mcp_servers) do
  if type(l_0_10) == "string" and type(l_0_11) == "table" then
    l_0_6[l_0_10] = l_0_11
  end
end
local l_0_12 = safeJsonSerialize
local l_0_13 = {}
l_0_13.configFilePath = l_0_1
local l_0_14 = {}
-- DECOMPILER ERROR at PC139: No list found for R9 , SetList fails

-- DECOMPILER ERROR at PC147: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC148: Overwrote pending register: R8 in 'AssignReg'

if l_0_13 then
  return l_0_13
end
-- DECOMPILER ERROR at PC150: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC152: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R9 in 'AssignReg'

local l_0_15, l_0_16 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_13, "ai_discovery_scan")
if l_0_15 and l_0_16 ~= nil then
  for l_0_20,l_0_21 in pairs(l_0_16) do
    if l_0_20 == l_0_14 and l_0_21 == l_0_12 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_13, "ai_discovery_scan", l_0_14, l_0_12, 86400, 100)
  local l_0_22 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_22 then
    (MpCommon.BmTriggerSig)(tostring(l_0_22), "AIDiscovery_grokbuild_toml", l_0_12)
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

