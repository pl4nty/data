-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21b388636fe9\1.luac 

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
local l_0_7 = function(l_2_0, l_2_1)
  -- function num : 0_1
  do
    local l_2_6 = string.lower
    l_2_6 = l_2_6((string.sub)(l_2_0, 1, l_2_1))
    l_2_0 = l_2_6
    l_2_6 = string
    l_2_6 = l_2_6.gsub
    local l_2_2 = nil
    l_2_2 = l_2_0
    local l_2_3 = nil
    l_2_3 = "[^%w%.%-_@]"
    local l_2_4 = nil
    l_2_4 = "_"
    local l_2_5 = nil
    do return l_2_6(l_2_2, l_2_3, l_2_4) end
    -- DECOMPILER ERROR at PC17: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_8 = {}
l_0_8.root = true
l_0_8.admin = true
l_0_8.administrator = true
l_0_8.test = true
l_0_8.user = true
l_0_8.guest = true
l_0_8.ubuntu = true
l_0_8.debian = true
l_0_8.centos = true
l_0_8["ec2-user"] = true
l_0_8.oracle = true
l_0_8.postgres = true
l_0_8.mysql = true
l_0_8.git = true
l_0_8.ftp = true
l_0_8.deploy = true
l_0_8.support = true
l_0_8.backup = true
l_0_8.www = true
l_0_8["www-data"] = true
l_0_5 = (string.sub)(l_0_5, 1, 128)
local l_0_9 = l_0_7(l_0_5, 128)
do
  if (string.match)(l_0_1, "username:([^;]*)") or "unknown" == "" then
    local l_0_10 = "unknown"
  end
  -- DECOMPILER ERROR at PC121: Confused about usage of register: R10 in 'UnsetPending'

  local l_0_11 = l_0_7(l_0_10, 64)
  local l_0_12 = 60
  local l_0_13 = 120
  local l_0_14 = 8
  local l_0_15 = 5
  local l_0_16 = 6
  local l_0_17 = 3
  local l_0_18 = 900
  local l_0_19 = 512
  local l_0_20 = scrubData(l_0_9)
  if type(l_0_20) ~= "string" or l_0_20 == "" then
    return mp.CLEAN
  end
  local l_0_21 = (string.sub)(l_0_20, 1, 1)
  local l_0_22 = "ssh_in_fail_total_v2_" .. l_0_21
  local l_0_23 = "ssh_in_fail_users_v2_" .. l_0_21
  local l_0_24 = "ssh_in_reported_" .. l_0_9
  if not pcall(MpCommon.RollingQueueCreate, l_0_22, l_0_19, l_0_12, 0) then
    return mp.CLEAN
  end
  local l_0_25 = pcall(MpCommon.RollingQueueAppend, l_0_22, l_0_9, l_0_11, l_0_12)
  if not l_0_25 then
    return mp.CLEAN
  end
  local l_0_26 = 0
  l_0_25 = pcall(MpCommon.RollingQueueCountValuesForKey, l_0_22, l_0_9)
  -- DECOMPILER ERROR at PC201: Overwrote pending register: R25 in 'AssignReg'

  if not l_0_25 or l_0_26 == nil then
    l_0_25 = pcall(MpCommon.RollingQueueCreate, l_0_23, l_0_19, l_0_13, 0)
    if not l_0_25 then
      return mp.CLEAN
    end
    l_0_25 = pcall(MpCommon.RollingQueueAppend, l_0_23, l_0_9, l_0_11, l_0_13)
    if not l_0_25 then
      return mp.CLEAN
    end
    local l_0_27 = nil
    l_0_25 = pcall(MpCommon.RollingQueueQueryMultiKey, l_0_23, l_0_9)
    if not l_0_25 or type(l_0_27) ~= "table" then
      return mp.CLEAN
    end
    local l_0_28 = 0
    local l_0_29 = 0
    local l_0_30 = 0
    local l_0_31 = {}
    local l_0_32 = {}
    for l_0_36,l_0_37 in ipairs(l_0_27) do
      if l_0_37 and type(l_0_37.value) == "string" then
        local l_0_38 = l_0_37.value
        if l_0_38 == l_0_11 then
          l_0_28 = l_0_28 + 1
        end
        if l_0_31[l_0_38] ~= true then
          l_0_31[l_0_38] = true
          l_0_29 = l_0_29 + 1
        end
        if l_0_8[l_0_38] == true and l_0_32[l_0_38] ~= true then
          l_0_32[l_0_38] = true
          l_0_30 = l_0_30 + 1
        end
      end
    end
    local l_0_39 = nil
    local l_0_40 = l_0_13
    if l_0_14 <= l_0_26 then
      l_0_39 = "failure_burst"
      l_0_40 = l_0_12
    else
      if l_0_15 <= l_0_29 then
        l_0_39 = "password_spray"
      else
        if l_0_16 <= l_0_28 then
          l_0_39 = "single_user_dictionary"
        else
          if l_0_17 <= l_0_30 then
            l_0_39 = "common_username_spray"
          end
        end
      end
    end
    if l_0_39 ~= nil and not isTainted(l_0_24, "ssh-bruteforce-reported") then
      taint(l_0_24, "ssh-bruteforce-reported", l_0_18)
      local l_0_41 = "username_" .. scrubData(l_0_11)
      ;
      (bm.trigger_sig)("ssh-bruteforce-incoming", "reason:" .. l_0_39 .. ";source_type:" .. l_0_4 .. ";source:" .. l_0_5 .. ";username:" .. l_0_41 .. ";failures:" .. tostring(l_0_26) .. ";user_failures:" .. tostring(l_0_28) .. ";distinct_users:" .. tostring(l_0_29) .. ";common_users:" .. tostring(l_0_30) .. ";window:" .. tostring(l_0_40))
    end
    do
      return mp.CLEAN
    end
  end
end

