-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_lmstudiobionic_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!ng-mcp.json") or not (mp.get_mpattribute)("Lua:LastFolder0!.internal") or not (mp.get_mpattribute)("Lua:LastFolder1!bionic") or not (mp.get_mpattribute)("Lua:LastFolder2!apps") or not (mp.get_mpattribute)("Lua:LastFolder3!.lmstudio") then
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
if type(l_0_4) ~= "table" or type(l_0_4.servers) ~= "table" then
  return mp.CLEAN
end
local l_0_5 = {}
for l_0_9,l_0_10 in ipairs(l_0_4.servers) do
  if type(l_0_10) == "table" and type(l_0_10.connection) == "table" then
    do
      if not l_0_10.id then
        local l_0_11, l_0_12, l_0_13, l_0_14 = l_0_10.name
      end
      -- DECOMPILER ERROR at PC136: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC140: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC142: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC145: Confused about usage of register: R11 in 'UnsetPending'

      if type(l_0_11) == "string" and l_0_11 ~= "" then
        do
          do
            if l_0_5[l_0_11] ~= nil then
              local l_0_15 = l_0_11 .. "#" .. tostring(l_0_9)
            end
            -- DECOMPILER ERROR at PC152: Confused about usage of register: R11 in 'UnsetPending'

            l_0_5[l_0_15] = l_0_10.connection
            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
local l_0_16 = safeJsonSerialize
local l_0_17 = {}
l_0_17.configFilePath = l_0_1
local l_0_18 = {}
-- DECOMPILER ERROR at PC162: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC170: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC171: Overwrote pending register: R7 in 'AssignReg'

if l_0_17 then
  return l_0_17
end
-- DECOMPILER ERROR at PC173: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC174: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC176: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC177: Overwrote pending register: R8 in 'AssignReg'

local l_0_19, l_0_20 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_17, "ai_discovery_scan")
if l_0_19 and l_0_20 ~= nil then
  for l_0_24,l_0_25 in pairs(l_0_20) do
    if l_0_24 == l_0_18 and l_0_25 == l_0_16 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_17, "ai_discovery_scan", l_0_18, l_0_16, 86400, 100)
  local l_0_26 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_26 then
    (MpCommon.BmTriggerSig)(tostring(l_0_26), "AIDiscovery_lmstudiobionic_json", l_0_16)
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

