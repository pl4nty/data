-- Threat: !InfrastructureShared
-- Name: 123d7b241a328
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.lower(MpCommon.GetImagePathFromPid(l_0_0) or "")
local l_0_4 = mp.GetParentProcInfo()
local l_0_5 = ""
if l_0_4 ~= nil and l_0_4.image_path ~= nil then
  l_0_5 = string.lower(l_0_4.image_path)
end

local function l_0_6(l_1_0, l_1_1)
  return string.find(l_1_0, l_1_1, 1, true) ~= nil
end

local function l_0_7(l_2_0, l_2_1)
  return string.find(l_2_0, l_2_1, 1, true) == 1
end

local function l_0_8(l_3_0, l_3_1)
  return l_3_0:sub(-#l_3_1) == l_3_1
end

local function l_0_9()
  return l_0_8(l_0_3, "/chmod") or l_0_8(l_0_3, "/chown") or l_0_8(l_0_3, "/setfacl") or l_0_8(l_0_3, "/chattr") or l_0_8(l_0_3, "/chflags") or l_0_8(l_0_3, "/xattr")
end

local function l_0_10()
  return l_0_6(l_0_2, "/var/log") or l_0_6(l_0_2, "/library/logs") or l_0_6(l_0_2, "falcon-sensor") or l_0_6(l_0_2, "mdatp") or l_0_6(l_0_2, "ds_agent") or l_0_6(l_0_2, "sentinel") or l_0_6(l_0_2, "wdavdaemon")
end

local function l_0_11()
  return l_0_8(l_0_5, "/dpkg") or l_0_8(l_0_5, "/apt") or l_0_8(l_0_5, "/dkms") or l_0_8(l_0_5, "/make") or l_0_8(l_0_5, "/bazel")
end

local function l_0_12()
  return l_0_7(l_0_3, "/usr/bin/") or l_0_7(l_0_3, "/usr/sbin/") or l_0_7(l_0_3, "/bin/") or l_0_7(l_0_3, "/sbin/") or l_0_7(l_0_3, "/usr/local/bin/") or l_0_7(l_0_3, "/usr/libexec/")
end

local function l_0_13()
  return l_0_6(l_0_3, "/tmp/") or l_0_6(l_0_3, "/dev/shm/") or l_0_6(l_0_3, "/home/")
end

local function l_0_14()
  return l_0_8(l_0_5, "/sshd") or l_0_8(l_0_5, "/python3") or l_0_8(l_0_5, "/perl")
end

local function l_0_15()
  return l_0_6(l_0_2, "nsenter --target 1") or l_0_6(l_0_2, "/proc/1/root/") or l_0_6(l_0_2, "base64 -d") or l_0_6(l_0_2, "base64 --decode")
end

if not (l_0_9() and l_0_10()) or not l_0_13() and not l_0_14() and not l_0_15() and (l_0_11() or not not l_0_12()) then
  return mp.CLEAN
end
return mp.INFECTED
