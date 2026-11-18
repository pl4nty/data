-- Threat: !InfrastructureShared
-- Name: 41b3e41defd9
-- Type: 21

local l_0_0 = 1000
if not this_sigattrlog[3].matched then
  return mp.CLEAN
end
if this_sigattrlog[3].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[3].utf8p1
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end

local function l_0_2(l_1_0, l_1_1)
  if l_1_1 < 0 or l_1_1 + 2 > #l_1_0 then
    return nil
  end
  local l_1_2, l_1_3 = string.byte(l_1_0, l_1_1 + 1, l_1_1 + 2)
  return l_1_2 + l_1_3 * 256
end

local function l_0_3(l_2_0, l_2_1)
  if l_2_1 < 0 or l_2_1 + 4 > #l_2_0 then
    return nil
  end
  local l_2_2, l_2_3, l_2_4, l_2_5 = string.byte(l_2_0, l_2_1 + 1, l_2_1 + 4)
  return l_2_2 + l_2_3 * 256 + l_2_4 * 65536 + l_2_5 * 16777216
end

local function l_0_4(l_3_0, l_3_1, l_3_2)
  return 0 <= l_3_1 and 0 <= l_3_2 and l_3_1 <= #l_3_0 and l_3_2 <= #l_3_0 - l_3_1
end

local function l_0_5(l_4_0)
  if string.sub(l_4_0, 1, 2) ~= "MZ" then
    return false
  end
  local l_4_1 = l_0_3(l_4_0, 60)
  if l_4_1 == nil or l_4_1 < 64 then
    return false
  end
  if not l_0_4(l_4_0, l_4_1, 4) or string.sub(l_4_0, l_4_1 + 1, l_4_1 + 4) ~= "PE\000\000" then
    return false
  end
  local l_4_2 = l_4_1 + 4
  local l_4_3 = l_0_2(l_4_0, l_4_2 + 18)
  local l_4_4 = l_0_2(l_4_0, l_4_2 + 16)
  if l_4_3 == nil or l_4_4 == nil then
    return false
  end
  if mp.bitand(l_4_3, 2) ~= 0 then
    return false
  end
  local l_4_5 = l_4_2 + 20
  if not l_0_4(l_4_0, l_4_5, l_4_4) then
    return false
  end
  local l_4_6 = l_0_2(l_4_0, l_4_5)
  local l_4_7, l_4_8
  if l_4_6 == 267 then
    l_4_7 = l_4_5 + 92
    l_4_8 = l_4_5 + 96
  elseif l_4_6 == 523 then
    l_4_7 = l_4_5 + 108
    l_4_8 = l_4_5 + 112
  else
    return false
  end
  local l_4_9 = l_0_3(l_4_0, l_4_7)
  if l_4_9 == nil or l_4_9 <= 14 then
    return false
  end
  local l_4_10 = l_0_3(l_4_0, l_4_8 + 112)
  local l_4_11 = l_0_3(l_4_0, l_4_8 + 112 + 4)
  return l_4_10 ~= nil and l_4_10 ~= 0 and l_4_11 ~= nil and l_4_11 ~= 0
end

local l_0_6, l_0_7 = pcall(sysio.GetFileSize, l_0_1)
if not l_0_6 or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = l_0_0
if l_0_0 > l_0_7 then
  l_0_8 = l_0_7
end
local l_0_9, l_0_10 = pcall(sysio.ReadFileRaw, l_0_1, 0, l_0_8)
if not l_0_9 or l_0_10 == nil then
  return mp.CLEAN
end
if not l_0_5(l_0_10) then
  return mp.CLEAN
end
return mp.INFECTED
