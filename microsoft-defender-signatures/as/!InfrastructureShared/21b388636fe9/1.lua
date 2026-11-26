-- Threat: !InfrastructureShared
-- Name: 21b388636fe9
-- Type: 21
-- Includes: BMLuaLib

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

local function l_0_7(l_2_0, l_2_1)
  l_2_0 = string.lower(string.sub(l_2_0, 1, l_2_1))
  return string.gsub(l_2_0, "[^%w%.%-_@]", "_")
end

local l_0_8 = {
  root = true,
  admin = true,
  administrator = true,
  test = true,
  user = true,
  guest = true,
  ubuntu = true,
  debian = true,
  centos = true,
  ["ec2-user"] = true,
  oracle = true,
  postgres = true,
  mysql = true,
  git = true,
  ftp = true,
  deploy = true,
  support = true,
  backup = true,
  www = true,
  ["www-data"] = true
}
l_0_5 = string.sub(l_0_5, 1, 128)
local l_0_9 = l_0_7(l_0_5, 128)
local l_0_10 = string.match(l_0_1, "username:([^;]*)") or "unknown"
if l_0_10 == "" then
  l_0_10 = "unknown"
end
l_0_10 = l_0_7(l_0_10, 64)
local l_0_11 = 60
local l_0_12 = 120
local l_0_13 = 10
local l_0_14 = 5
local l_0_15 = 8
local l_0_16 = 4
local l_0_17 = 900
local l_0_18 = 512
local l_0_19 = scrubData(l_0_9)
if type(l_0_19) ~= "string" or l_0_19 == "" then
  return mp.CLEAN
end
local l_0_20 = string.sub(l_0_19, 1, 1)
local l_0_21 = "ssh_in_fail_total_v2_" .. l_0_20
local l_0_22 = "ssh_in_fail_users_v2_" .. l_0_20
local l_0_23 = "ssh_in_reported_" .. l_0_9
local l_0_24 = pcall(MpCommon.RollingQueueCreate, l_0_21, l_0_18, l_0_11, 0)
if not l_0_24 then
  return mp.CLEAN
end
l_0_24 = pcall(MpCommon.RollingQueueAppend, l_0_21, l_0_9, l_0_10, l_0_11)
if not l_0_24 then
  return mp.CLEAN
end
local l_0_25 = 0
l_0_24, l_0_25 = pcall(MpCommon.RollingQueueCountValuesForKey, l_0_21, l_0_9)
if not l_0_24 or l_0_25 == nil then
  l_0_25 = 0
end
l_0_24 = pcall(MpCommon.RollingQueueCreate, l_0_22, l_0_18, l_0_12, 0)
if not l_0_24 then
  return mp.CLEAN
end
l_0_24 = pcall(MpCommon.RollingQueueAppend, l_0_22, l_0_9, l_0_10, l_0_12)
if not l_0_24 then
  return mp.CLEAN
end
local l_0_26
l_0_24, l_0_26 = pcall(MpCommon.RollingQueueQueryMultiKey, l_0_22, l_0_9)
if not l_0_24 or type(l_0_26) ~= "table" then
  return mp.CLEAN
end
local l_0_27 = 0
local l_0_28 = 0
local l_0_29 = 0
local l_0_30 = {}
local l_0_31 = {}
for l_0_32, l_0_33 in ipairs(l_0_26) do
  if l_0_33 and type(l_0_33.value) == "string" then
    local l_0_34 = l_0_33.value
    if l_0_34 == l_0_10 then
      l_0_27 = l_0_27 + 1
    end
    if l_0_30[l_0_34] ~= true then
      l_0_30[l_0_34] = true
      l_0_28 = l_0_28 + 1
    end
    if l_0_8[l_0_34] == true and l_0_31[l_0_34] ~= true then
      l_0_31[l_0_34] = true
      l_0_29 = l_0_29 + 1
    end
  end
end
local l_0_35
if l_0_13 <= l_0_25 then
  l_0_35 = "failure_burst"
elseif l_0_14 <= l_0_28 then
  l_0_35 = "password_spray"
elseif l_0_15 <= l_0_27 then
  l_0_35 = "single_user_dictionary"
elseif l_0_16 <= l_0_29 then
  l_0_35 = "common_username_spray"
end
if l_0_35 ~= nil and not isTainted(l_0_23, "ssh-bruteforce-reported") then
  taint(l_0_23, "ssh-bruteforce-reported", l_0_17)
end
return mp.CLEAN
