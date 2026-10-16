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

l_0_5 = (string.sub)(l_0_5, 1, 128)
local l_0_8 = l_0_7(l_0_5, 128)
do
  if (string.match)(l_0_1, "username:([^;]*)") or "unknown" == "" then
    local l_0_9 = "unknown"
  end
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R9 in 'UnsetPending'

  local l_0_10 = l_0_7(l_0_9, 64)
  local l_0_11 = 120
  local l_0_12 = 900
  local l_0_13 = scrubData(l_0_8)
  if type(l_0_13) ~= "string" or l_0_13 == "" then
    return mp.CLEAN
  end
  local l_0_14 = (string.sub)(l_0_13, 1, 1)
  local l_0_15 = "ssh_in_fail_users_v2_" .. l_0_14
  local l_0_16 = "ssh_in_reported_" .. l_0_8
  local l_0_17 = "ssh_in_success_reported_" .. l_0_8
  if not isTainted(l_0_16, "ssh-bruteforce-reported") then
    return mp.CLEAN
  end
  local l_0_18, l_0_19 = pcall(MpCommon.RollingQueueQueryMultiKey, l_0_15, l_0_8)
  if not l_0_18 or type(l_0_19) ~= "table" then
    return mp.CLEAN
  end
  local l_0_20 = 0
  for l_0_24,l_0_25 in ipairs(l_0_19) do
    if l_0_25 and l_0_25.value == l_0_10 then
      l_0_20 = l_0_20 + 1
    end
  end
  if l_0_20 == 0 then
    return mp.CLEAN
  end
  if isTainted(l_0_17, "ssh-bruteforce-success-reported") then
    return mp.CLEAN
  end
  taint(l_0_17, "ssh-bruteforce-success-reported", l_0_12)
  local l_0_26 = "username_" .. scrubData(l_0_10)
  local l_0_27 = "source_type:" .. l_0_4 .. ";source:" .. l_0_5 .. ";username:" .. l_0_26 .. ";recent_user_failures:" .. tostring(l_0_20) .. ";window:" .. tostring(l_0_11)
  set_research_data("SshBruteForceIncomingSuccess", l_0_27, true)
  TrackPidAndTechniqueBM("BM", "T1078", "InitialAccess_SshBruteForceSuccess")
  return mp.INFECTED
end

