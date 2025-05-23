-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanScriptPSUrlExtractB\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == 0 or l_0_0 > 1000000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  -- DECOMPILER ERROR at PC4: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC9: Overwrote pending register: R3 in 'AssignReg'

  if l_1_0:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$") == 4 then
    for l_1_5,l_1_6 in pairs() do
      if tonumber(l_1_6) < 0 or tonumber(l_1_6) > 255 then
        return false
      end
    end
    return true
  end
  return false
end

local l_0_3 = function(l_2_0)
  -- function num : 0_1
  do return l_2_0:match("^%w[%w%.%-]*%.%w%w%w?%w?%w?$") ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_4 = {}
local l_0_5 = "https?://([%w%.%-]+)[:%d]*"
for l_0_9 in l_0_1:gmatch(l_0_5) do
  if l_0_9 and (l_0_2(l_0_9) or l_0_3(l_0_9)) then
    (table.insert)(l_0_4, l_0_9)
  end
end
local l_0_10 = false
if #l_0_4 > 0 then
  local l_0_11 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_11 == nil then
    return mp.CLEAN
  end
  local l_0_12 = (mp.GetProcessCommandLine)(l_0_11)
  if l_0_12 == nil or l_0_12 == "" then
    return mp.CLEAN
  end
  for l_0_16,l_0_17 in ipairs(l_0_4) do
    l_0_10 = IsHostAttackServerCloudChk(l_0_17, "ALF:Trojan:Script/PSUrlExtract.B", "powershell", l_0_12, "NOLOOKUP")
    if l_0_10 then
      local l_0_18 = (string.format)("scenario:powershell_attacksvr_download;attacksvr:%s", l_0_17)
      TT_SendBMSigTrigger(l_0_11, "file_from_attackerserver", l_0_18)
      return mp.INFECTED
    end
  end
end
do
  l_0_11 = mp
  l_0_11 = l_0_11.CLEAN
  return l_0_11
end

