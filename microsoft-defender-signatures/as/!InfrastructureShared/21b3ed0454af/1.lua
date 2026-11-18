-- Threat: !InfrastructureShared
-- Name: 21b3ed0454af
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, ResearchData

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = this_sigattrlog[1].utf8p2
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "service:([^;]*)")
local l_0_3 = string.match(l_0_1, "authmethod:([^;]*)")
if l_0_2 ~= "sshd" or l_0_3 ~= "1" then
  return mp.CLEAN
end
local l_0_4 = "ip"
local l_0_5 = string.match(l_0_0, "^Ip:([^;]+)")
if l_0_5 == nil or l_0_5 == "" then
  l_0_4 = "host"
  l_0_5 = string.match(l_0_0, "^Host:([^;]+)")
end
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end

local function l_0_6(l_1_0, l_1_1)
  local l_1_2 = string.lower(l_1_0)
  l_1_2 = string.gsub(l_1_2, "%.$", "")
  if l_1_1 == "host" then
    return l_1_2 == "localhost" or l_1_2 == "localhost.localdomain" or l_1_2 == "localhost6" or l_1_2 == "localhost6.localdomain6" or string.match(l_1_2, "%.localhost$") ~= nil
  end
  return string.match(l_1_2, "^127%.") ~= nil or l_1_2 == "::1" or l_1_2 == "0:0:0:0:0:0:0:1" or string.match(l_1_2, "^::ffff:127%.") ~= nil or string.match(l_1_2, "^0:0:0:0:0:ffff:127%.") ~= nil
end

if l_0_6(l_0_5, l_0_4) then
  return mp.CLEAN
end

local function l_0_7(l_2_0)
  local l_2_1, l_2_2, l_2_3, l_2_4 = string.match(l_2_0, "^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
  if l_2_1 == nil then
    return nil
  end
  l_2_1 = tonumber(l_2_1)
  l_2_2 = tonumber(l_2_2)
  l_2_3 = tonumber(l_2_3)
  l_2_4 = tonumber(l_2_4)
  if l_2_1 == nil or l_2_2 == nil or l_2_3 == nil or l_2_4 == nil then
    return nil
  end
  if 255 < l_2_1 or 255 < l_2_2 or 255 < l_2_3 or 255 < l_2_4 then
    return nil
  end
  return l_2_1, l_2_2, l_2_3, l_2_4
end

local function l_0_8(l_3_0)
  if string.find(l_3_0, ".", 1, true) ~= nil then
    local l_3_1, l_3_2 = string.match(l_3_0, "^(.*:)([^:]+)$")
    local l_3_3, l_3_4, l_3_5, l_3_6 = l_0_7(l_3_2 or "")
    if l_3_3 == nil then
      return {}
    end
    l_3_0 = l_3_1 .. string.format("%x:%x", l_3_3 * 256 + l_3_4, l_3_5 * 256 + l_3_6)
  end
  if string.match(l_3_0, "^[0-9a-f:]+$") == nil then
    return {}
  end
  local l_3_7 = string.find(l_3_0, "::", 1, true)
  if string.find(l_3_0, ":::", 1, true) ~= nil or l_3_7 ~= nil and string.find(l_3_0, "::", l_3_7 + 2, true) ~= nil or string.sub(l_3_0, 1, 1) == ":" and l_3_7 ~= 1 or string.sub(l_3_0, -1) == ":" and string.sub(l_3_0, -2) ~= "::" then
    return {}
  end
  local l_3_8 = {}
  local l_3_9 = 0
  for l_3_10, l_3_11 in string.gmatch(l_3_0, "()([^:]+)") do
    if 4 < #l_3_11 or #l_3_8 == 8 then
      return {}
    end
    l_3_8[#l_3_8 + 1] = tonumber(l_3_11, 16)
    if l_3_7 ~= nil and l_3_10 < l_3_7 then
      l_3_9 = l_3_9 + 1
    end
  end
  if l_3_7 == nil then
    if #l_3_8 ~= 8 then
      return {}
    end
  else
    if 8 <= #l_3_8 then
      return {}
    end
    for l_3_12 = 1, 8 - #l_3_8 do
      table.insert(l_3_8, l_3_9 + 1, 0)
    end
  end
  return l_3_8
end

local function l_0_9(l_4_0, l_4_1)
  if l_4_1 ~= "ip" or l_4_0 == nil or l_4_0 == "" then
    return "non_ip_source"
  end
  local l_4_2 = string.lower(l_4_0)
  if string.sub(l_4_2, 1, 1) == "[" then
    if string.sub(l_4_2, -1) ~= "]" then
      return "invalid_ip"
    end
    l_4_2 = string.sub(l_4_2, 2, -2)
  end
  local l_4_3 = string.find(l_4_2, "%", 1, true)
  if l_4_3 ~= nil then
    if string.find(l_4_2, ":", 1, true) == nil or string.match(string.sub(l_4_2, l_4_3 + 1), "^[%w_.%-]+$") == nil then
      return "invalid_ip"
    end
    l_4_2 = string.sub(l_4_2, 1, l_4_3 - 1)
  end
  local l_4_4, l_4_5, l_4_6, l_4_7 = l_0_7(l_4_2)
  local l_4_8 = {}
  if l_4_4 == nil then
    l_4_8 = l_0_8(l_4_2)
    if next(l_4_8) == nil then
      return "invalid_ip"
    end
    if l_4_8[1] == 0 and l_4_8[2] == 0 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 65535 then
      l_4_5 = l_4_8[7] % 256
      l_4_4 = (l_4_8[7] - l_4_5) / 256
      l_4_7 = l_4_8[8] % 256
      l_4_6 = (l_4_8[8] - l_4_7) / 256
    end
  end
  if l_4_4 ~= nil then
    if l_4_4 == 10 then
      return "private_ipv4"
    end
    if l_4_4 == 172 and 16 <= l_4_5 and l_4_5 <= 31 then
      return "private_ipv4"
    end
    if l_4_4 == 192 and l_4_5 == 168 then
      return "private_ipv4"
    end
    if l_4_4 == 127 then
      return "loopback_ipv4"
    end
    if l_4_4 == 169 and l_4_5 == 254 then
      return "link_local_ipv4"
    end
    if l_4_4 == 100 and 64 <= l_4_5 and l_4_5 <= 127 then
      return "carrier_nat_ipv4"
    end
    if l_4_4 == 0 then
      return "special_ipv4"
    end
    if 224 <= l_4_4 then
      return "multicast_or_reserved_ipv4"
    end
    if l_4_4 == 192 and l_4_5 == 0 and l_4_6 == 0 and l_4_7 ~= 9 and l_4_7 ~= 10 then
      return "reserved_ipv4"
    end
    if l_4_4 == 192 and l_4_5 == 0 and l_4_6 == 2 then
      return "reserved_ipv4"
    end
    if l_4_4 == 192 and l_4_5 == 88 and l_4_6 == 99 then
      return "reserved_ipv4"
    end
    if l_4_4 == 198 and (l_4_5 == 18 or l_4_5 == 19) then
      return "reserved_ipv4"
    end
    if l_4_4 == 198 and l_4_5 == 51 and l_4_6 == 100 then
      return "reserved_ipv4"
    end
    if l_4_4 == 203 and l_4_5 == 0 and l_4_6 == 113 then
      return "reserved_ipv4"
    end
    return "public_ipv4"
  end
  local l_4_9 = l_4_8[1]
  local l_4_10 = l_4_8[2]
  if l_4_9 == 0 and l_4_10 == 0 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 0 and l_4_8[7] == 0 then
    if l_4_8[8] == 0 then
      return "unspecified_ipv6"
    end
    if l_4_8[8] == 1 then
      return "loopback_ipv6"
    end
  end
  if 64512 <= l_4_9 and l_4_9 <= 65023 then
    return "private_ipv6_ula"
  end
  if 65152 <= l_4_9 and l_4_9 <= 65215 then
    return "link_local_ipv6"
  end
  if 65280 <= l_4_9 then
    return "multicast_ipv6"
  end
  if l_4_9 == 8193 and l_4_10 == 3512 or l_4_9 == 16383 and l_4_10 < 4096 then
    return "documentation_ipv6"
  end
  if l_4_9 < 8192 or 16383 < l_4_9 then
    if l_4_9 == 100 and l_4_10 == 65435 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 0 then
      return "public_ipv6"
    end
    return "reserved_ipv6"
  end
  if l_4_9 == 8193 and l_4_10 < 512 then
    local l_4_12 = l_4_10 == 1 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 0 and l_4_8[7] == 0 and 1 <= l_4_8[8] and 3 >= l_4_8[8]
    if not l_4_12 and l_4_10 ~= 3 and (l_4_10 ~= 4 or l_4_8[3] ~= 274) and (not (32 <= l_4_10) or not (l_4_10 <= 63)) then
      return "reserved_ipv6"
    end
  end
  if l_4_9 == 8194 then
    return "reserved_ipv6"
  end
  return "public_ipv6"
end

local function l_0_10(l_5_0, l_5_1)
  l_5_0 = string.lower(string.sub(l_5_0, 1, l_5_1))
  return string.gsub(l_5_0, "[^%w%.%-_@]", "_")
end

l_0_5 = string.sub(l_0_5, 1, 128)
local l_0_11 = l_0_10(l_0_5, 128)
local l_0_12 = string.match(l_0_1, "username:([^;]*)") or "unknown"
if l_0_12 == "" then
  l_0_12 = "unknown"
end
l_0_12 = l_0_10(l_0_12, 64)
local l_0_13 = 120
local l_0_14 = 900
local l_0_15 = scrubData(l_0_11)
if type(l_0_15) ~= "string" or l_0_15 == "" then
  return mp.CLEAN
end
local l_0_16 = string.sub(l_0_15, 1, 1)
local l_0_17 = "ssh_in_fail_users_v2_" .. l_0_16
local l_0_18 = "ssh_in_reported_" .. l_0_11
local l_0_19 = "ssh_in_success_reported_" .. l_0_11 .. "_" .. l_0_12
local l_0_20 = 5
if not isTainted(l_0_18, "ssh-bruteforce-reported") then
  return mp.CLEAN
end
local l_0_21, l_0_22 = pcall(MpCommon.RollingQueueQueryMultiKey, l_0_17, l_0_11)
if not l_0_21 or type(l_0_22) ~= "table" then
  return mp.CLEAN
end
local l_0_23 = 0
for l_0_24, l_0_25 in ipairs(l_0_22) do
  if l_0_25 and l_0_25.value == l_0_12 then
    l_0_23 = l_0_23 + 1
  end
end
if l_0_20 > l_0_23 then
  return mp.CLEAN
end
if isTainted(l_0_19, "ssh-bruteforce-success-reported") then
  return mp.CLEAN
end
taint(l_0_19, "ssh-bruteforce-success-reported", l_0_14)
local l_0_26 = "username_" .. scrubData(l_0_12)
local l_0_27 = l_0_9(l_0_5, l_0_4)
local l_0_28 = "source_type:" .. l_0_4 .. ";source_kind:" .. l_0_27 .. ";source_hash:" .. l_0_15 .. ";source:" .. l_0_5 .. ";username:" .. l_0_26 .. ";recent_user_failures:" .. tostring(l_0_23) .. ";window:" .. tostring(l_0_13)
set_research_data("SshBruteForceIncomingSuccess", l_0_28, true)
if l_0_27 == "public_ipv4" or l_0_27 == "public_ipv6" then
  bm.trigger_sig("ssh-bruteforce-incoming-success-public", l_0_28)
end
TrackPidAndTechniqueBM("BM", "T1078", "InitialAccess_SshBruteForceSuccess")
return mp.INFECTED
