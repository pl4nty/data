-- Threat: !InfrastructureShared
-- Name: 121d75aa4b11f
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
local l_0_6 = false
if l_0_3:sub(-5) == "/date" and string.find(l_0_2, " -s", 1, true) then
  l_0_6 = true
end
if not l_0_6 and l_0_3:sub(-12) == "/timedatectl" and (string.find(l_0_2, "set-time", 1, true) or string.find(l_0_2, "set-ntp false", 1, true)) then
  l_0_6 = true
end
if not l_0_6 and l_0_3:sub(-12) == "/systemsetup" and (string.find(l_0_2, "-setusingnetworktime off", 1, true) or string.find(l_0_2, "-setdate", 1, true) or string.find(l_0_2, "-settime", 1, true)) then
  l_0_6 = true
end
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = false
if l_0_5:sub(-8) == "/ansible" or l_0_5:sub(-7) == "/puppet" or l_0_5:sub(-12) == "/chef-client" or l_0_5:sub(-12) == "/salt-minion" or l_0_5:sub(-8) == "/chronyd" or l_0_5:sub(-18) == "/systemd-timesyncd" then
  l_0_7 = true
end
if not l_0_7 and (string.find(l_0_3, "/usr/bin/", 1, true) == 1 or string.find(l_0_3, "/usr/sbin/", 1, true) == 1 or string.find(l_0_3, "/bin/", 1, true) == 1 or string.find(l_0_3, "/sbin/", 1, true) == 1 or string.find(l_0_3, "/usr/local/bin/", 1, true) == 1 or string.find(l_0_3, "/usr/libexec/", 1, true) == 1) then
  l_0_7 = true
end
if not l_0_7 then
  return mp.INFECTED
end
local l_0_8 = false
if string.find(l_0_3, "/tmp/", 1, true) or string.find(l_0_3, "/dev/shm/", 1, true) or string.find(l_0_3, "/home/", 1, true) then
  l_0_8 = true
end
if not l_0_8 and (l_0_5:sub(-8) == "/python3" or l_0_5:sub(-5) == "/perl") then
  l_0_8 = true
end
if not l_0_8 and (string.find(l_0_2, "nsenter --target 1", 1, true) or string.find(l_0_2, "/proc/1/root/", 1, true) or string.find(l_0_2, "base64 -d", 1, true) or string.find(l_0_2, "base64 --decode", 1, true)) then
  l_0_8 = true
end
if not l_0_8 then
  return mp.CLEAN
end
return mp.INFECTED
