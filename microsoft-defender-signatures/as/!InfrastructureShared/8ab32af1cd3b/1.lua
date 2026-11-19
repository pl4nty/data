-- Threat: !InfrastructureShared
-- Name: 8ab32af1cd3b
-- Type: 21

local l_0_0 = 0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16384 then
    l_0_0 = l_0_0 + 1
  end
end
if 1 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2.integrity_level <= MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
if this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[2].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[2].utf8p2
local l_0_4 = this_sigattrlog[3].utf8p1
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
  if not l_1_0 then
    return nil
  end
  l_1_0 = l_1_0:lower():gsub("/", "\\"):gsub("^\"%s*", ""):gsub("%s*\"$", ""):gsub("\\+", "\\")
  if 3 < #l_1_0 then
    l_1_0 = l_1_0:gsub("\\+$", "")
  end
  return l_1_0
end

local function l_0_6(l_2_0)
  local l_2_1 = l_2_0:match("%-o\"([^\"]+)\"") or l_2_0:match("%-o([^%s]+)")
  return l_2_1 and l_0_5(l_2_1) or nil
end

local l_0_7 = l_0_6(l_0_3)
local l_0_8 = l_0_5(l_0_4)
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
if l_0_7:sub(-1) ~= "\\" then
  l_0_7 = l_0_7 .. "\\"
end
if l_0_8:sub(1, #l_0_7) ~= l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
