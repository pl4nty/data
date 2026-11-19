-- Threat: !InfrastructureShared
-- Name: 592d77bae3084
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
if #l_0_1 < 16 or 450 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if not string.find(l_0_3, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeys("IsClickFixCMD")
if l_0_4 == nil then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
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

local function l_0_6(l_2_0)
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end

local l_0_7 = l_0_6(l_0_1)
if l_0_7 == nil or #l_0_7 < 2 then
  return mp.CLEAN
end
if #l_0_1 < 50 then
  local l_0_8 = string.match(l_0_7[1], "[^\\/]+$")
  if l_0_8 ~= "mshta.exe" and l_0_8 ~= "mshta" or #l_0_7 ~= 2 or not string.match(l_0_7[2], "^https?://[^/\\%s?#]") then
    return mp.CLEAN
  end
end
local l_0_9 = l_0_5(l_0_1)
local l_0_10 = l_0_6(l_0_9) or {}

local function l_0_11(l_3_0, l_3_1)
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

local function l_0_12(l_4_0)
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

for l_0_13, l_0_14 in ipairs(l_0_4) do
  if type(l_0_14) == "string" and l_0_14 ~= "" then
    local l_0_15 = GetRollingQueueKeyValue("IsClickFixCMD", l_0_14)
    if l_0_11(l_0_6(l_0_14), l_0_7) then
      if l_0_15 then
        mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_15))
      end
      return mp.INFECTED
    end
    local l_0_16 = l_0_6(l_0_5(l_0_14))
    if l_0_11(l_0_16, l_0_10) then
      if l_0_15 then
        mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_15))
      end
      return mp.INFECTED
    end
    if l_0_16 ~= nil then
      local l_0_17 = l_0_12(l_0_16)
      if l_0_17 ~= nil and string.find(l_0_9, l_0_17, 1, true) then
        if l_0_15 then
          mp.set_mpattribute("MpInternal_researchdata=WCS=" .. tostring(l_0_15))
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
