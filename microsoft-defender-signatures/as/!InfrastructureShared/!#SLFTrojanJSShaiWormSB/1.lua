-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSShaiWormSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.gsub)(l_0_0, "\\", "/")
local l_0_2 = {}
-- DECOMPILER ERROR at PC72: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC73: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC74: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC75: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC76: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R5 in 'AssignReg'

if not (".aws/credentials")(".aws/config", "accesstokens.json") then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_3 then
  return mp.CLEAN
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = contains
-- DECOMPILER ERROR at PC106: Overwrote pending register: R6 in 'AssignReg'

local l_0_6 = "msal_token_cache"
local l_0_7 = {}
-- DECOMPILER ERROR at PC108: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC109: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC110: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC112: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC116: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC117: Overwrote pending register: R5 in 'AssignReg'

if not l_0_5 then
  return l_0_5
end
-- DECOMPILER ERROR at PC119: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC125: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC126: Overwrote pending register: R6 in 'AssignReg'

if not l_0_5 then
  return l_0_6
end
-- DECOMPILER ERROR at PC128: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC129: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC133: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC133: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC138: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC139: Overwrote pending register: R6 in 'AssignReg'

if not l_0_6 and not l_0_6 then
  return l_0_6
end
-- DECOMPILER ERROR at PC141: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC142: Overwrote pending register: R7 in 'AssignReg'

local l_0_8 = 8
-- DECOMPILER ERROR at PC144: Overwrote pending register: R9 in 'AssignReg'

local l_0_9 = ".kube/config"
-- DECOMPILER ERROR at PC145: Overwrote pending register: R10 in 'AssignReg'

local l_0_10 = "k3s.yaml"
local l_0_11 = {}
-- DECOMPILER ERROR at PC147: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC148: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R16 in 'AssignReg'

local l_0_12 = ".config/helm/" .. ".ansible/" .. ".docker/config.json" .. "config.v2.json" .. ".ssh/id_rsa"
do
  local l_0_13 = GetRollingQueueKeyValues(l_0_6, l_0_12)
  if l_0_13 then
    for l_0_17,l_0_18 in ipairs(l_0_13) do
      -- DECOMPILER ERROR at PC165: Overwrote pending register: R19 in 'AssignReg'

      if l_0_18 and ".ssh/id_ed25519" == l_0_1 then
        return mp.CLEAN
      end
    end
    if l_0_8 < #l_0_13 then
      set_research_data("ShaiWorm_SuspCredAccess", (MpCommon.Base64Encode)(l_0_11), false)
      return mp.INFECTED
    end
  end
  -- DECOMPILER ERROR at PC205: Overwrote pending register: R20 in 'AssignReg'

  AppendToRollingQueue(l_0_6, l_0_12, l_0_1, l_0_7, l_0_9, ".ssh/config")
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

