-- Threat: !InfrastructureShared
-- Name: !#RtpLogSkipLinux
-- Type: 26

local function l_0_0(l_1_0, l_1_1)
  return l_1_1 ~= nil and l_1_0 ~= nil and #l_1_0 >= #l_1_1 and string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

local function l_0_1(l_2_0, l_2_1)
  return l_2_1 ~= nil and l_2_0 ~= nil and #l_2_0 == #l_2_1 and l_2_0 == l_2_1
end

local function l_0_2(l_3_0, l_3_1)
  return l_3_1 == "" or l_3_0:sub(-#l_3_1) == l_3_1
end

local function l_0_3(l_4_0)
  if l_0_1(l_4_0, "hdbwlarchiver") or l_0_1(l_4_0, "hdbscriptserver") or l_0_1(l_4_0, "hdbdocstore") or l_0_1(l_4_0, "hdbxscontroller") or l_0_1(l_4_0, "hdbxsexeagent") or l_0_1(l_4_0, "hdbxsuaaserver") or l_0_1(l_4_0, "hdbxsuaaserver") or l_0_1(l_4_0, "hdbdpserver") or l_0_1(l_4_0, "hdbstreamingserver") or l_0_1(l_4_0, "hdbetsserver") or l_0_1(l_4_0, "hdbnameserver") or l_0_1(l_4_0, "hdbcompileserver") or l_0_1(l_4_0, "hdbpreprocessor") or l_0_1(l_4_0, "hdbindexserver") or l_0_1(l_4_0, "hdbxsengine") or l_0_1(l_4_0, "hdbrsutil") or l_0_1(l_4_0, "hdbdiserver") or l_0_1(l_4_0, "hdbwebdispatcher") or l_0_1(l_4_0, "hdbstatisticsserver") then
    return true
  end
end

local l_0_4 = skip.get_contextdata(skip.CONTEXT_DATA_PROCESSNAME)
local l_0_5 = skip.get_contextdata(skip.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_6 = skip.get_contextdata(skip.CONTEXT_DATA_FILEPATH)
local l_0_7 = skip.get_contextdata(skip.CONTEXT_DATA_FILENAME)
if l_0_0(l_0_5, "/usr/lib/gcc") and l_0_1(l_0_4, "cc1plus") then
  if l_0_0(l_0_6, "/usr/lib") then
    return 1
  end
  if l_0_0(l_0_6, "/lib") then
    return 1
  end
end
if l_0_0(l_0_6, "/var/log/") then
  if l_0_2(l_0_6, ".log") and (l_0_2(l_0_5, "/nginx") or l_0_2(l_0_5, "/httpd") or l_0_2(l_0_5, "/apache2") or l_0_2(l_0_5, "/mysqld") or l_0_2(l_0_5, "/postgres")) then
    return 1
  end
  if l_0_2(l_0_6, ".journal") and l_0_2(l_0_5, "/systemd-journald") then
    return 1
  end
end
if l_0_0(l_0_4, "hdb") then
  if l_0_0(l_0_6, "/usr/sap") and l_0_2(l_0_7, ".trc") and l_0_3(l_0_4) then
    return 1
  elseif l_0_0(l_0_6, "/hana/data") or l_0_0(l_0_6, "/hana/log") then
    if (l_0_2(l_0_7, ".dat") or l_0_1(l_0_7, "nameserver.lck")) and l_0_3(l_0_4) then
      return 1
    end
  elseif l_0_0(l_0_6, "/hana/shared") and l_0_0(l_0_7, "log_backup") and l_0_3(l_0_4) then
    return 1
  end
end
if l_0_2(l_0_6, ".TXT") and l_0_2(l_0_5, "/bin/ucxjlx6") then
  return 1
end
if l_0_0(l_0_6, "/proc") then
  local l_0_8 = "/proc/(%d+)/(%a+)"
  local l_0_9, l_0_10, l_0_11, l_0_12 = string.find(l_0_6, l_0_8)
  if l_0_9 and (l_0_12 == "task" or l_0_12 == "fd") then
    l_0_8 = "^%d+$"
    if l_0_7 ~= nil and string.find(l_0_7, l_0_8) then
      return 1
    end
  end
  return 0
end
if l_0_0(l_0_6, "/snap/core") then
  local l_0_13 = "/snap/core/(%d+)/dev/core"
  if l_0_6 ~= nil and string.find(l_0_6, l_0_13) then
    return 1
  end
end
return 0
