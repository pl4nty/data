-- Threat: !InfrastructureShared
-- Name: 62b37048d68f
-- Type: 21

local l_0_0 = "AsrTrackedVulDrivers"
local l_0_1 = "AsrTrackedVulDriversRQ1"
local l_0_2 = "AsrRuleRqSpace"
local l_0_3 = 1
local l_0_4 = 315360000
if mp.IsHipsRuleEnabled("56a863a9-875e-4185-98a7-b882c64b5ce5") ~= true then
  pcall(MpCommon.RollingQueueEraseNamespaced, l_0_1, l_0_2)
  pcall(MpCommon.RollingQueueEraseNamespaced, l_0_0, l_0_2)
  return mp.CLEAN
end
local l_0_5 = ""
local l_0_6 = ""
if this_sigattrlog[1].matched then
  l_0_5 = this_sigattrlog[1].utf8p1
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = MpCommon.PathToWin32Path(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = string.lower(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_6 = this_sigattrlog[1].utf8p2
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = MpCommon.PathToWin32Path(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = string.lower(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
elseif this_sigattrlog[2].matched then
  l_0_5 = this_sigattrlog[2].utf8p2
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = MpCommon.PathToWin32Path(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = string.lower(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_6 = this_sigattrlog[2].utf8p1
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = MpCommon.PathToWin32Path(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = string.lower(l_0_6)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_1, l_0_2, l_0_5)
if l_0_7 and l_0_8 ~= nil then
  pcall(MpCommon.RollingQueueAppendNamespaced, l_0_1, l_0_2, l_0_6, l_0_3, l_0_4)
  return mp.INFECTED
end
return mp.CLEAN
