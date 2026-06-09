-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb35ab4be1c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = {}
-- DECOMPILER ERROR at PC40: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("/opt/microsoft/omsagent/")("/opt/microsoft/scx/") do
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R10 in 'AssignReg'

  if (("omsagent").find)(l_0_3, l_0_9, 1, true) or (string.find)(l_0_1, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
local l_0_10 = false
local l_0_11 = "T1059.004"
local l_0_12 = ""
if (string.find)(l_0_1, "curl ", 1, true) and (string.find)(l_0_1, "| bash", 1, true) then
  l_0_10 = true
  l_0_12 = "curl_pipe_bash"
  l_0_11 = "T1105"
else
  if (string.find)(l_0_1, "curl ", 1, true) and (string.find)(l_0_1, "| sh", 1, true) then
    l_0_10 = true
    l_0_12 = "curl_pipe_sh"
    l_0_11 = "T1105"
  else
    if (string.find)(l_0_1, "wget ", 1, true) and (string.find)(l_0_1, "| bash", 1, true) then
      l_0_10 = true
      l_0_12 = "wget_pipe_bash"
      l_0_11 = "T1105"
    else
      if (string.find)(l_0_1, "wget ", 1, true) and (string.find)(l_0_1, "| sh", 1, true) then
        l_0_10 = true
        l_0_12 = "wget_pipe_sh"
        l_0_11 = "T1105"
      else
        if (string.find)(l_0_1, "/dev/tcp/", 1, true) then
          l_0_10 = true
          l_0_12 = "bash_reverse_shell"
          l_0_11 = "T1059.004"
        else
          if (string.find)(l_0_1, "python", 1, true) and (string.find)(l_0_1, "import socket", 1, true) then
            l_0_10 = true
            l_0_12 = "python_reverse_shell"
            l_0_11 = "T1059.006"
          else
            if (string.find)(l_0_1, "python", 1, true) and (string.find)(l_0_1, "import urllib", 1, true) then
              l_0_10 = true
              l_0_12 = "python_download"
              l_0_11 = "T1105"
            end
          end
        end
      end
    end
  end
end
if not l_0_10 then
  if (string.find)(l_0_1, "/etc/shadow", 1, true) then
    l_0_10 = true
    l_0_12 = "shadow_read"
    l_0_11 = "T1003.008"
  else
    if (string.find)(l_0_1, "/etc/passwd", 1, true) and not (string.find)(l_0_1, "getent", 1, true) then
      l_0_10 = true
      l_0_12 = "passwd_read"
      l_0_11 = "T1087.001"
    else
      if (string.find)(l_0_1, "/proc/self/environ", 1, true) then
        l_0_10 = true
        l_0_12 = "proc_environ_read"
        l_0_11 = "T1552.001"
      else
        if (string.find)(l_0_1, ".bash_history", 1, true) or (string.find)(l_0_1, ".zsh_history", 1, true) then
          l_0_10 = true
          l_0_12 = "history_read"
          l_0_11 = "T1552.003"
        end
      end
    end
  end
end
if not l_0_10 then
  if (string.find)(l_0_1, "crontab", 1, true) and ((string.find)(l_0_1, "-e", 1, true) or (string.find)(l_0_1, "-l", 1, true) == nil) then
    l_0_10 = true
    l_0_12 = "crontab_modify"
    l_0_11 = "T1053.003"
  else
    if (string.find)(l_0_1, "/etc/cron", 1, true) then
      l_0_10 = true
      l_0_12 = "cron_write"
      l_0_11 = "T1053.003"
    else
      if (string.find)(l_0_1, "chmod ", 1, true) and (string.find)(l_0_1, "+s", 1, true) then
        l_0_10 = true
        l_0_12 = "suid_set"
        l_0_11 = "T1548.001"
      else
        if (string.find)(l_0_1, "systemctl", 1, true) and (string.find)(l_0_1, "enable", 1, true) then
          l_0_10 = true
          l_0_12 = "service_enable"
          l_0_11 = "T1543.002"
        end
      end
    end
  end
end
if not l_0_10 then
  if (string.find)(l_0_1, "history -c", 1, true) or (string.find)(l_0_1, "unset histfile", 1, true) or (string.find)(l_0_1, "export histsize=0", 1, true) then
    l_0_10 = true
    l_0_12 = "history_clear"
    l_0_11 = "T1070.003"
  else
    if (string.find)(l_0_1, "rm ", 1, true) and ((string.find)(l_0_1, "/var/log", 1, true) or (string.find)(l_0_1, "/var/run/utmp", 1, true) or (string.find)(l_0_1, "/var/log/wtmp", 1, true)) then
      l_0_10 = true
      l_0_12 = "log_delete"
      l_0_11 = "T1070.002"
    end
  end
end
if not l_0_10 then
  local l_0_13 = 0
  local l_0_14 = {}
  -- DECOMPILER ERROR at PC461: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC462: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC463: Overwrote pending register: R11 in 'AssignReg'

  for l_0_18,l_0_19 in ("whoami")(" id ") do
    -- DECOMPILER ERROR at PC466: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC468: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC469: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC470: Overwrote pending register: R18 in 'AssignReg'

  end
end
do
  do
    -- DECOMPILER ERROR at PC485: Overwrote pending register: R8 in 'AssignReg'

    if ((("ip addr").find)("ip route", "netstat", "ss -", true) and l_0_13 < 2) or not l_0_10 then
      return l_0_13.CLEAN
    end
    ;
    (bm.add_related_string)("OMIChild_reason", l_0_12, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("OMIChild_cmd", l_0_1, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("OMIChild_img", l_0_3, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", l_0_11, "OMIChild")
    add_parents()
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

