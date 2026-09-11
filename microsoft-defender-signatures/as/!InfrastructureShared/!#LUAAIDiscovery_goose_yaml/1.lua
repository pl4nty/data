-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_goose_yaml\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (not (mp.get_mpattribute)("Lua:FnameAttr!config.yaml") and not (mp.get_mpattribute)("Lua:FnameAttr!config.yml")) or not (mp.get_mpattribute)("Lua:LastFolder0!goose") and (not (mp.get_mpattribute)("Lua:LastFolder0!config") or not (mp.get_mpattribute)("Lua:LastFolder1!goose") or not (mp.get_mpattribute)("Lua:LastFolder2!block")) then
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
local l_0_4, l_0_5, l_0_6 = pcall(MpCommon.YamlDeserialize, tostring(l_0_3))
if not l_0_4 or l_0_6 ~= "ok" or type(l_0_5) ~= "table" or type(l_0_5.extensions) ~= "table" then
  return mp.CLEAN
end
local l_0_7 = {}
for l_0_11,l_0_12 in pairs(l_0_5.extensions) do
  if type(l_0_11) == "string" and type(l_0_12) == "table" then
    local l_0_13 = {}
    l_0_13.command = l_0_12.cmd
    l_0_13.args = l_0_12.args
    l_0_13.env = l_0_12.envs
    l_0_13.url = l_0_12.uri
    l_0_13.type = l_0_12.type
    l_0_7[l_0_11] = l_0_13
  end
end
local l_0_14 = safeJsonSerialize
local l_0_15 = {}
l_0_15.configFilePath = l_0_1
local l_0_16 = {}
-- DECOMPILER ERROR at PC164: No list found for R10 , SetList fails

-- DECOMPILER ERROR at PC172: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC173: Overwrote pending register: R9 in 'AssignReg'

if l_0_15 then
  return l_0_15
end
-- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC176: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC177: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC178: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC179: Overwrote pending register: R10 in 'AssignReg'

local l_0_17, l_0_18 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_15, "ai_discovery_scan")
if l_0_17 and l_0_18 ~= nil then
  for l_0_22,l_0_23 in pairs(l_0_18) do
    if l_0_22 == l_0_16 and l_0_23 == l_0_14 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_15, "ai_discovery_scan", l_0_16, l_0_14, 86400, 100)
  local l_0_24 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_24 then
    (MpCommon.BmTriggerSig)(tostring(l_0_24), "AIDiscovery_goose_yaml", l_0_14)
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

