-- Threat: Trojan:Script/PSUrlExtract.B
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: PowerShell:WebClient & MpIsPowerShellAMSIScan

local l_0_0 = mp.getfilesize()
if l_0_0 == 0 or 1000000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  local l_1_1 = {
    l_1_0:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
  }
  if #l_1_1 == 4 then
    for l_1_2, l_1_3 in pairs(l_1_1) do
      if tonumber(l_1_3) < 0 or tonumber(l_1_3) > 255 then
        return false
      end
    end
    return true
  end
  return false
end

local function l_0_3(l_2_0)
  return l_2_0:match("^%w[%w%.%-]*%.%w%w%w?%w?%w?$") ~= nil
end

local l_0_4 = {}
local l_0_5 = "https?://([%w%.%-]+)[:%d]*"
for l_0_6 in l_0_1:gmatch(l_0_5) do
  if l_0_6 and (l_0_2(l_0_6) or l_0_3(l_0_6)) then
    table.insert(l_0_4, l_0_6)
  end
end
local l_0_7 = false
if 0 < #l_0_4 then
  local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_8 == nil then
    return mp.CLEAN
  end
  local l_0_9 = mp.GetProcessCommandLine(l_0_8)
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  for l_0_10, l_0_11 in ipairs(l_0_4) do
    l_0_7 = IsHostAttackServerCloudChk(l_0_11, "ALF:Trojan:Script/PSUrlExtract.B", "powershell", l_0_9, "NOLOOKUP")
    if l_0_7 then
      local l_0_12 = string.format("scenario:powershell_attacksvr_download;attacksvr:%s", l_0_11)
      TT_SendBMSigTrigger(l_0_8, "file_from_attackerserver", l_0_12)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
