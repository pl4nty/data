-- Threat: !InfrastructureShared
-- Name: 63ad7d9e050d2
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_3 = versioning.IsSampled(100, true, true, true) == false
if l_0_3 and (#l_0_1 < 16 or 450 < #l_0_1) then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 == nil or l_0_4.image_path == nil then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4.image_path)
local l_0_6 = string.match(l_0_5, "([^\\]+)$")
if l_0_6 ~= "explorer.exe" and l_0_6 ~= "windowsterminal.exe" and l_0_6 ~= "wt.exe" then
  return mp.CLEAN
end
local l_0_7 = GetRollingQueueKeys("IsClickFixCMD_Malicious")
if l_0_7 == nil then
  return mp.CLEAN
end

local function l_0_8(l_1_0)
  if l_1_0 == nil or l_1_0 == "" then
    return ""
  end
  l_1_0 = string.gsub(l_1_0, "%^", "")
  local l_1_1, l_1_2 = pcall(mp.ContextualExpandEnvironmentVariables, l_1_0)
  if l_1_1 and type(l_1_2) == "string" and l_1_2 ~= "" then
    l_1_0 = l_1_2
  end
  return string.lower(l_1_0)
end

local function l_0_9(l_2_0)
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end

local l_0_10 = l_0_9(l_0_1)
if l_0_10 == nil or #l_0_10 < 2 then
  return mp.CLEAN
end
if l_0_3 and #l_0_1 < 50 then
  local l_0_11 = string.match(l_0_10[1], "[^\\/]+$")
  if l_0_11 ~= "mshta.exe" and l_0_11 ~= "mshta" or #l_0_10 ~= 2 or not string.match(l_0_10[2], "^https?://[^/\\%s?#]") then
    return mp.CLEAN
  end
end
local l_0_12 = l_0_8(l_0_1)
local l_0_13 = l_0_9(l_0_12) or {}

local function l_0_14(l_3_0, l_3_1)
  if l_3_0 == nil or l_3_1 == nil or #l_3_0 < 2 or #l_3_0 ~= #l_3_1 then
    return false
  end
  for l_3_2 = 2, #l_3_0 do
    if string.lower(l_3_0[l_3_2]) ~= string.lower(l_3_1[l_3_2]) then
      return false
    end
  end
  return true
end

local function l_0_15(l_4_0)
  local l_4_1
  for l_4_2 = 2, #l_4_0 do
    local l_4_3 = l_4_0[l_4_2]
    if l_4_3 ~= nil and (l_4_1 == nil or string.len(l_4_3) > string.len(l_4_1)) then
      l_4_1 = l_4_3
    end
  end
  if l_4_1 ~= nil and string.len(l_4_1) >= 20 then
    return string.lower(l_4_1)
  end
  return nil
end

for l_0_16, l_0_17 in ipairs(l_0_7) do
  if type(l_0_17) == "string" and l_0_17 ~= "" then
    local l_0_18 = GetRollingQueueKeyValue("IsClickFixCMD_Malicious", l_0_17)
    if l_0_14(l_0_9(l_0_17), l_0_10) then
      if l_0_18 then
        mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_18))
      end
      return mp.INFECTED
    end
    local l_0_19 = l_0_9(l_0_8(l_0_17))
    if l_0_14(l_0_19, l_0_13) then
      if l_0_18 then
        mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_18))
      end
      return mp.INFECTED
    end
    if l_0_19 ~= nil then
      local l_0_20 = l_0_15(l_0_19)
      if l_0_20 ~= nil and string.find(l_0_12, l_0_20, 1, true) then
        if l_0_18 then
          mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_18))
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
