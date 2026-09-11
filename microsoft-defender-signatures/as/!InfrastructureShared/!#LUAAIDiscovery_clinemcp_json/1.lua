-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_clinemcp_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (not (mp.get_mpattribute)("Lua:FnameAttr!cline_mcp_settings.json") or not (mp.get_mpattribute)("Lua:LastFolder0!settings") or (not (mp.get_mpattribute)("Lua:LastFolder1!data") or not (mp.get_mpattribute)("Lua:LastFolder2!.cline")) and (not (mp.get_mpattribute)("Lua:LastFolder1!saoudrizwan.claude-dev") or not (mp.get_mpattribute)("Lua:LastFolder2!globalstorage") or not (mp.get_mpattribute)("Lua:LastFolder3!user"))) then
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
local l_0_4 = safeJsonDeserialize(tostring(l_0_3))
if type(l_0_4) ~= "table" or type(l_0_4.mcpServers) ~= "table" then
  return mp.CLEAN
end
local l_0_5 = {}
for l_0_9,l_0_10 in pairs(l_0_4.mcpServers) do
  if type(l_0_10.transport) ~= "table" or not l_0_10.transport then
    do
      l_0_5[l_0_9] = type(l_0_9) ~= "string" or type(l_0_10) ~= "table" or l_0_10
      -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
end
local l_0_11 = safeJsonSerialize
local l_0_12 = {}
l_0_12.configFilePath = l_0_1
local l_0_13 = {}
-- DECOMPILER ERROR at PC162: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC170: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC171: Overwrote pending register: R7 in 'AssignReg'

if l_0_12 then
  return l_0_12
end
-- DECOMPILER ERROR at PC173: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC174: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC176: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC177: Overwrote pending register: R8 in 'AssignReg'

local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_12, "ai_discovery_scan")
if l_0_14 and l_0_15 ~= nil then
  for l_0_19,l_0_20 in pairs(l_0_15) do
    if l_0_19 == l_0_13 and l_0_20 == l_0_11 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_12, "ai_discovery_scan", l_0_13, l_0_11, 86400, 100)
  local l_0_21 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_21 then
    (MpCommon.BmTriggerSig)(tostring(l_0_21), "AIDiscovery_clinemcp_json", l_0_11)
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

