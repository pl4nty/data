-- Threat: !InfrastructureShared
-- Name: adb35ab4be1c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
local l_0_4 = {
  "/opt/microsoft/omsagent/",
  "/opt/microsoft/scx/",
  "/opt/microsoft/dsc/",
  "/opt/omi/lib/",
  "test-wsman",
  "omsagent"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_3, l_0_6, 1, true) or string.find(l_0_1, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
local l_0_7 = false
local l_0_8 = "T1059.004"
local l_0_9 = ""
if string.find(l_0_1, "curl ", 1, true) and string.find(l_0_1, "| bash", 1, true) then
  l_0_7 = true
  l_0_9 = "curl_pipe_bash"
  l_0_8 = "T1105"
elseif string.find(l_0_1, "curl ", 1, true) and string.find(l_0_1, "| sh", 1, true) then
  l_0_7 = true
  l_0_9 = "curl_pipe_sh"
  l_0_8 = "T1105"
elseif string.find(l_0_1, "wget ", 1, true) and string.find(l_0_1, "| bash", 1, true) then
  l_0_7 = true
  l_0_9 = "wget_pipe_bash"
  l_0_8 = "T1105"
elseif string.find(l_0_1, "wget ", 1, true) and string.find(l_0_1, "| sh", 1, true) then
  l_0_7 = true
  l_0_9 = "wget_pipe_sh"
  l_0_8 = "T1105"
elseif string.find(l_0_1, "/dev/tcp/", 1, true) then
  l_0_7 = true
  l_0_9 = "bash_reverse_shell"
  l_0_8 = "T1059.004"
elseif string.find(l_0_1, "python", 1, true) and string.find(l_0_1, "import socket", 1, true) then
  l_0_7 = true
  l_0_9 = "python_reverse_shell"
  l_0_8 = "T1059.006"
elseif string.find(l_0_1, "python", 1, true) and string.find(l_0_1, "import urllib", 1, true) then
  l_0_7 = true
  l_0_9 = "python_download"
  l_0_8 = "T1105"
end
if not l_0_7 then
  if string.find(l_0_1, "/etc/shadow", 1, true) then
    l_0_7 = true
    l_0_9 = "shadow_read"
    l_0_8 = "T1003.008"
  elseif string.find(l_0_1, "/etc/passwd", 1, true) and not string.find(l_0_1, "getent", 1, true) then
    l_0_7 = true
    l_0_9 = "passwd_read"
    l_0_8 = "T1087.001"
  elseif string.find(l_0_1, "/proc/self/environ", 1, true) then
    l_0_7 = true
    l_0_9 = "proc_environ_read"
    l_0_8 = "T1552.001"
  elseif string.find(l_0_1, ".bash_history", 1, true) or string.find(l_0_1, ".zsh_history", 1, true) then
    l_0_7 = true
    l_0_9 = "history_read"
    l_0_8 = "T1552.003"
  end
end
if not l_0_7 then
  if string.find(l_0_1, "crontab", 1, true) and (string.find(l_0_1, "-e", 1, true) or string.find(l_0_1, "-l", 1, true) == nil) then
    l_0_7 = true
    l_0_9 = "crontab_modify"
    l_0_8 = "T1053.003"
  elseif string.find(l_0_1, "/etc/cron", 1, true) then
    l_0_7 = true
    l_0_9 = "cron_write"
    l_0_8 = "T1053.003"
  elseif string.find(l_0_1, "chmod ", 1, true) and string.find(l_0_1, "+s", 1, true) then
    l_0_7 = true
    l_0_9 = "suid_set"
    l_0_8 = "T1548.001"
  elseif string.find(l_0_1, "systemctl", 1, true) and string.find(l_0_1, "enable", 1, true) then
    l_0_7 = true
    l_0_9 = "service_enable"
    l_0_8 = "T1543.002"
  end
end
if not l_0_7 then
  if string.find(l_0_1, "history -c", 1, true) or string.find(l_0_1, "unset histfile", 1, true) or string.find(l_0_1, "export histsize=0", 1, true) then
    l_0_7 = true
    l_0_9 = "history_clear"
    l_0_8 = "T1070.003"
  elseif string.find(l_0_1, "rm ", 1, true) and (string.find(l_0_1, "/var/log", 1, true) or string.find(l_0_1, "/var/run/utmp", 1, true) or string.find(l_0_1, "/var/log/wtmp", 1, true)) then
    l_0_7 = true
    l_0_9 = "log_delete"
    l_0_8 = "T1070.002"
  end
end
if not l_0_7 then
  local l_0_10 = 0
  local l_0_11 = {
    "whoami",
    " id ",
    "uname ",
    "hostname",
    "ifconfig",
    "ip addr",
    "ip route",
    "netstat",
    "ss -",
    "cat /etc/os-release"
  }
  for l_0_12, l_0_13 in ipairs(l_0_11) do
    if string.find(l_0_1, l_0_13, 1, true) then
      l_0_10 = l_0_10 + 1
    end
  end
  if 2 <= l_0_10 then
    l_0_7 = true
    l_0_9 = "multi_recon"
    l_0_8 = "T1082"
  end
end
if not l_0_7 then
  return mp.CLEAN
end
bm.add_related_string("OMIChild_reason", l_0_9, bm.RelatedStringBMReport)
bm.add_related_string("OMIChild_cmd", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("OMIChild_img", l_0_3, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", l_0_8, "OMIChild")
add_parents()
return mp.INFECTED
