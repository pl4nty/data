-- Threat: !InfrastructureShared
-- Name: 34d74fb2fb68
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  ["4.149.115.16/28"] = true,
  ["4.190.130.32/28"] = true,
  ["4.194.226.160/27"] = true,
  ["4.208.13.0/24"] = true,
  ["13.83.125.0/24"] = true,
  ["20.8.195.0/24"] = true,
  ["20.10.127.0/24"] = true,
  ["20.15.141.0/24"] = true,
  ["20.18.4.160/28"] = true,
  ["20.19.31.144/28"] = true,
  ["20.26.63.224/28"] = true,
  ["20.91.96.64/28"] = true,
  ["20.91.149.32/28"] = true,
  ["20.175.2.208/28"] = true,
  ["20.199.204.160/28"] = true,
  ["20.204.195.240/28"] = true,
  ["20.208.150.16/28"] = true,
  ["20.211.228.80/28"] = true,
  ["20.220.2.112/28"] = true,
  ["20.226.211.64/28"] = true,
  ["20.242.181.0/24"] = true,
  ["20.254.173.48/28"] = true,
  ["40.80.103.192/28"] = true,
  ["52.172.85.0/28"] = true,
  ["68.218.120.64/28"] = true
}

local function l_0_3(l_1_0, l_1_1)
  for l_1_2, l_1_3 in pairs(l_1_1) do
    local l_1_4, l_1_5 = l_1_2:match("(.+)/(%d+)")
    l_1_5 = tonumber(l_1_5)
    if isIPInNetmaskRange(l_1_0, l_1_4, l_1_5) then
      return true
    end
  end
  return false
end

local l_0_4 = "route(?:.exe)?\\s+add\\s+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\/\\d{1,2})\\s+mask"
local l_0_5 = "route(?:.exe)?\\s+add\\s+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})\\s+mask"
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch(l_0_4, l_0_1)
if l_0_6 and l_0_7 and l_0_2[l_0_7] then
  return mp.INFECTED
end
if not l_0_6 then
  local l_0_8, l_0_9 = MpCommon.StringRegExpSearch(l_0_5, l_0_1)
  if l_0_8 and l_0_9 and l_0_3(l_0_9, l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
