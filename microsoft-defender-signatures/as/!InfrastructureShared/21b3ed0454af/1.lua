-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21b3ed0454af\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p1
local l_0_1 = (this_sigattrlog[1]).utf8p2
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "service:([^;]*)")
local l_0_3 = (string.match)(l_0_1, "authmethod:([^;]*)")
if l_0_2 ~= "sshd" or l_0_3 ~= "1" then
  return mp.CLEAN
end
local l_0_4 = "ip"
local l_0_5 = (string.match)(l_0_0, "^Ip:([^;]+)")
if l_0_5 == nil or l_0_5 == "" then
  l_0_4 = "host"
  l_0_5 = (string.match)(l_0_0, "^Host:([^;]+)")
end
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = (string.lower)(l_1_0)
  l_1_2 = (string.gsub)(l_1_2, "%.$", "")
  if l_1_2 ~= "localhost" and l_1_2 ~= "localhost.localdomain" and l_1_2 ~= "localhost6" and l_1_2 ~= "localhost6.localdomain6" and (string.match)(l_1_2, "%.localhost$") == nil then
    do
      do return l_1_1 ~= "host" end
      do return (string.match)(l_1_2, "^127%.") ~= nil or l_1_2 == "::1" or l_1_2 == "0:0:0:0:0:0:0:1" or (string.match)(l_1_2, "^::ffff:127%.") ~= nil or (string.match)(l_1_2, "^0:0:0:0:0:ffff:127%.") ~= nil end
      -- DECOMPILER ERROR: 3 unprocessed JMP targets
    end
  end
end

if l_0_6(l_0_5, l_0_4) then
  return mp.CLEAN
end
local l_0_7 = function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2, l_2_3, l_2_4 = (string.match)(l_2_0, "^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
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
  if l_2_1 > 255 or l_2_2 > 255 or l_2_3 > 255 or l_2_4 > 255 then
    return nil
  end
  return l_2_1, l_2_2, l_2_3, l_2_4
end

local l_0_10 = function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_7
  if (string.find)(l_3_0, ".", 1, true) ~= nil then
    local l_3_1, l_3_2 = (string.match)(l_3_0, "^(.*:)([^:]+)$")
    local l_3_3 = l_0_7
    l_3_3 = l_3_3(l_3_2 or "")
    if l_3_3 == nil then
      return {}
    end
    l_3_0 = l_3_1 .. (string.format)("%x:%x", l_3_3 * 256 + (l_3_2 or ""), true * 256 + R6_PC30)
  end
  do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

    if (string.match)(l_3_0, "^[0-9a-f:]+$") == nil then
      return {}
    end
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

    local l_3_5 = nil
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC94: Unhandled construct in 'MakeBoolean' P3

    if (string.find)(l_3_5, ":::", 1, R6_PC30) ~= nil or (((string.find)(l_3_0, "::", 1, true) ~= nil and (string.find)(l_3_5, "::", (string.find)(l_3_0, "::", 1, true) + 2, R6_PC30) ~= nil) or (string.sub)(l_3_5, 1, 1) ~= ":" or (string.sub)(l_3_5, -1) ~= ":" or (string.sub)(l_3_5, -2) ~= "::") then
      return {}
    end
    local l_3_6 = nil
    local l_3_7 = {}
    -- DECOMPILER ERROR at PC100: Overwrote pending register: R6 in 'AssignReg'

    for l_3_11,l_3_12 in (string.gmatch)(l_3_5, R6_PC30) do
      local l_3_8 = 0
      if #(string.format)("%x:%x", l_3_3 * 256 + (l_3_2 or ""), true * 256 + R6_PC30) > 4 or #l_3_7 == 8 then
        return {}
      end
      l_3_7[#l_3_7 + 1] = tonumber(l_3_13, 16)
      if l_3_6 ~= nil and l_3_12 < l_3_6 then
        l_3_8 = l_3_8 + 1
      end
    end
    -- DECOMPILER ERROR at PC131: Unhandled construct in 'MakeBoolean' P1

    if l_3_6 == nil and #l_3_7 ~= 8 then
      return {}
    end
    if #l_3_7 >= 8 then
      return {}
    end
    for l_3_17 = 1, 8 - #l_3_7 do
      local l_3_14 = nil
      ;
      (table.insert)(l_3_7, l_3_14 + 1, 0)
    end
    do
      do
        do return l_3_7 end
        -- DECOMPILER ERROR at PC151: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

local l_0_11 = function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_7, l_0_8
  if l_4_1 ~= "ip" or l_4_0 == nil or l_4_0 == "" then
    return "non_ip_source"
  end
  local l_4_2 = (string.lower)(l_4_0)
  if (string.sub)(l_4_2, 1, 1) == "[" then
    if (string.sub)(l_4_2, -1) ~= "]" then
      return "invalid_ip"
    end
    l_4_2 = (string.sub)(l_4_2, 2, -2)
  end
  local l_4_3 = (string.find)(l_4_2, "%", 1, true)
  if l_4_3 ~= nil then
    if (string.find)(l_4_2, ":", 1, true) == nil or (string.match)((string.sub)(l_4_2, l_4_3 + 1), "^[%w_.%-]+$") == nil then
      return "invalid_ip"
    end
    l_4_2 = (string.sub)(l_4_2, 1, l_4_3 - 1)
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
    if l_4_4 == 172 and l_4_5 >= 16 and l_4_5 <= 31 then
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
    if l_4_4 == 100 and l_4_5 >= 64 and l_4_5 <= 127 then
      return "carrier_nat_ipv4"
    end
    if l_4_4 == 0 then
      return "special_ipv4"
    end
    if l_4_4 >= 224 then
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
  do
    local l_4_10 = l_4_8[2]
    if l_4_9 == 0 and l_4_10 == 0 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 0 and l_4_8[7] == 0 then
      if l_4_8[8] == 0 then
        return "unspecified_ipv6"
      end
      if l_4_8[8] == 1 then
        return "loopback_ipv6"
      end
    end
    if l_4_9 >= 64512 and l_4_9 <= 65023 then
      return "private_ipv6_ula"
    end
    if l_4_9 >= 65152 and l_4_9 <= 65215 then
      return "link_local_ipv6"
    end
    if l_4_9 >= 65280 then
      return "multicast_ipv6"
    end
    if (l_4_9 == 8193 and l_4_10 == 3512) or l_4_9 == 16383 and l_4_10 < 4096 then
      return "documentation_ipv6"
    end
    if l_4_9 < 8192 or l_4_9 > 16383 then
      if l_4_9 == 100 and l_4_10 == 65435 and l_4_8[3] == 0 and l_4_8[4] == 0 and l_4_8[5] == 0 and l_4_8[6] == 0 then
        return "public_ipv6"
      end
      return "reserved_ipv6"
    end
    if (((l_4_10 ~= 1 or l_4_8[3] ~= 0 or l_4_8[4] ~= 0 or l_4_8[5] ~= 0 or l_4_8[6] ~= 0 or l_4_8[7] ~= 0 or l_4_8[8] < 1 or l_4_8[8] > 3) and l_4_9 ~= 8193 or l_4_10 >= 512) or l_4_10 == 3 or (l_4_10 == 4 and l_4_8[3] == 274) or (l_4_10 < 32 or l_4_10 > 63)) then
      return "reserved_ipv6"
    end
    if l_4_9 == 8194 then
      return "reserved_ipv6"
    end
    do return "public_ipv6" end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

do
  if (string.match)(l_0_1, "username:([^;]*)") or "unknown" == "" then
    local l_0_12 = nil
  end
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R10 in 'UnsetPending'

  local l_0_13 = nil
  local l_0_14 = (function(l_5_0, l_5_1)
  -- function num : 0_4
  do
    local l_5_6 = string.lower
    l_5_6 = l_5_6((string.sub)(l_5_0, 1, l_5_1))
    l_5_0 = l_5_6
    l_5_6 = string
    l_5_6 = l_5_6.gsub
    local l_5_2 = nil
    l_5_2 = l_5_0
    local l_5_3 = nil
    l_5_3 = "[^%w%.%-_@]"
    local l_5_4 = nil
    l_5_4 = "_"
    local l_5_5 = nil
    do return l_5_6(l_5_2, l_5_3, l_5_4) end
    -- DECOMPILER ERROR at PC17: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end
)(l_0_5, 128)
  local l_0_15 = l_0_12("unknown", 64)
  local l_0_16 = 120
  if type(scrubData(l_0_14)) ~= "string" or scrubData(l_0_14) == "" then
    return mp.CLEAN
  end
  local l_0_17 = 900
  local l_0_18 = nil
  local l_0_19 = nil
  local l_0_20 = "ssh_in_fail_users_v2_" .. (string.sub)(scrubData(l_0_14), 1, 1)
  local l_0_21 = "ssh_in_reported_" .. l_0_14
  if not isTainted(l_0_21, "ssh-bruteforce-reported") then
    return mp.CLEAN
  end
  local l_0_22, l_0_23 = "ssh_in_success_reported_" .. l_0_14 .. "_" .. l_0_15, 5
  if not pcall(MpCommon.RollingQueueQueryMultiKey, l_0_20, l_0_14) or type(R24_PC162) ~= "table" then
    return mp.CLEAN
  end
  local l_0_24 = nil
  for l_0_28,l_0_29 in R24_PC162 do
    local l_0_25, l_0_26 = , 0
    -- DECOMPILER ERROR at PC173: Confused about usage of register: R28 in 'UnsetPending'

    if R28_PC173 and R28_PC173.value == l_0_15 then
      l_0_26 = l_0_26 + 1
    end
  end
  -- DECOMPILER ERROR at PC181: Confused about usage of register: R23 in 'UnsetPending'

  if l_0_26 < l_0_23 then
    return mp.CLEAN
  end
  if isTainted(l_0_22, "ssh-bruteforce-success-reported") then
    return mp.CLEAN
  end
  taint(l_0_22, "ssh-bruteforce-success-reported", l_0_17)
  local l_0_30 = nil
  local l_0_31 = nil
  do
    local l_0_32 = nil
    set_research_data("SshBruteForceIncomingSuccess", "source_type:" .. l_0_4 .. ";source_kind:" .. l_0_11(l_0_5, l_0_4) .. ";source_hash:" .. l_0_18 .. ";source:" .. l_0_5 .. ";username:" .. "username_" .. scrubData(l_0_15) .. ";recent_user_failures:" .. tostring(l_0_31) .. ";window:" .. tostring(l_0_16), true)
    -- DECOMPILER ERROR at PC240: Confused about usage of register: R26 in 'UnsetPending'

    if l_0_11(l_0_5, l_0_4) == "public_ipv4" or l_0_11(l_0_5, l_0_4) == "public_ipv6" then
      (bm.trigger_sig)("ssh-bruteforce-incoming-success-public", "source_type:" .. l_0_4 .. ";source_kind:" .. l_0_11(l_0_5, l_0_4) .. ";source_hash:" .. l_0_18 .. ";source:" .. l_0_5 .. ";username:" .. "username_" .. scrubData(l_0_15) .. ";recent_user_failures:" .. tostring(l_0_31) .. ";window:" .. tostring(l_0_16))
    end
    TrackPidAndTechniqueBM("BM", "T1078", "InitialAccess_SshBruteForceSuccess")
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC250: freeLocal<0 in 'ReleaseLocals'

  end
end

