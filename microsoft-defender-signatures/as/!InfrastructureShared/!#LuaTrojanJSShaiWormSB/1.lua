-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTrojanJSShaiWormSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "node.exe" and l_0_0 ~= "bun.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.gsub)(l_0_1, "\\", "/")
local l_0_3 = {}
-- DECOMPILER ERROR at PC97: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC98: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC99: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC100: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC101: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC103: Overwrote pending register: R6 in 'AssignReg'

if not (".aws/credentials")(".aws/config", "accesstokens.json") then
  return mp.CLEAN
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = contains
-- DECOMPILER ERROR at PC131: Overwrote pending register: R7 in 'AssignReg'

local l_0_7 = "msal_token_cache"
local l_0_8 = {}
-- DECOMPILER ERROR at PC133: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC134: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC135: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC136: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC137: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC141: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC142: Overwrote pending register: R6 in 'AssignReg'

if not l_0_6 then
  return l_0_6
end
-- DECOMPILER ERROR at PC144: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC145: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R7 in 'AssignReg'

if not l_0_6 then
  return l_0_7
end
-- DECOMPILER ERROR at PC153: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC158: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC158: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC163: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC164: Overwrote pending register: R7 in 'AssignReg'

if not l_0_7 and not l_0_7 then
  return l_0_7
end
-- DECOMPILER ERROR at PC166: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC167: Overwrote pending register: R8 in 'AssignReg'

local l_0_9 = 8
-- DECOMPILER ERROR at PC169: Overwrote pending register: R10 in 'AssignReg'

local l_0_10 = ".kube/config"
-- DECOMPILER ERROR at PC170: Overwrote pending register: R11 in 'AssignReg'

local l_0_11 = "k3s.yaml"
local l_0_12 = {}
-- DECOMPILER ERROR at PC172: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC173: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC174: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC175: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC176: Overwrote pending register: R17 in 'AssignReg'

local l_0_13 = ".config/helm/" .. ".ansible/" .. ".docker/config.json" .. "config.v2.json" .. ".ssh/id_rsa"
do
  local l_0_14 = GetRollingQueueKeyValues(l_0_7, l_0_13)
  if l_0_14 then
    for l_0_18,l_0_19 in ipairs(l_0_14) do
      -- DECOMPILER ERROR at PC190: Overwrote pending register: R20 in 'AssignReg'

      if l_0_19 and ".ssh/id_ed25519" == l_0_2 then
        return mp.CLEAN
      end
    end
    if l_0_9 < #l_0_14 then
      set_research_data("ShaiWorm_SuspCredAccess", (MpCommon.Base64Encode)(l_0_12), false)
      return mp.INFECTED
    end
  end
  -- DECOMPILER ERROR at PC230: Overwrote pending register: R21 in 'AssignReg'

  AppendToRollingQueue(l_0_7, l_0_13, l_0_2, l_0_8, l_0_10, ".ssh/config")
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

