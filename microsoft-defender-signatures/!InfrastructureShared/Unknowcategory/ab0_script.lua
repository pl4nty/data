-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\ab0_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  do return l_1_1 ~= nil and l_1_0 ~= nil and #l_1_1 <= #l_1_0 and (string.sub)(l_1_0, 1, (string.len)(l_1_1)) == l_1_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  do return l_2_1 ~= nil and l_2_0 ~= nil and #l_2_0 == #l_2_1 and l_2_0 == l_2_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_2 = function(l_3_0, l_3_1)
  -- function num : 0_2
  do return l_3_1 == "" or l_3_0:sub(-#l_3_1) == l_3_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_4 = function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_1
  if l_0_1(l_4_0, "hdbwlarchiver") or l_0_1(l_4_0, "hdbscriptserver") or l_0_1(l_4_0, "hdbdocstore") or l_0_1(l_4_0, "hdbxscontroller") or l_0_1(l_4_0, "hdbxsexeagent") or l_0_1(l_4_0, "hdbxsuaaserver") or l_0_1(l_4_0, "hdbxsuaaserver") or l_0_1(l_4_0, "hdbdpserver") or l_0_1(l_4_0, "hdbstreamingserver") or l_0_1(l_4_0, "hdbetsserver") or l_0_1(l_4_0, "hdbnameserver") or l_0_1(l_4_0, "hdbcompileserver") or l_0_1(l_4_0, "hdbpreprocessor") or l_0_1(l_4_0, "hdbindexserver") or l_0_1(l_4_0, "hdbxsengine") or l_0_1(l_4_0, "hdbrsutil") or l_0_1(l_4_0, "hdbdiserver") or l_0_1(l_4_0, "hdbwebdispatcher") or l_0_1(l_4_0, "hdbstatisticsserver") then
    return true
  end
end

local l_0_5 = (skip.get_contextdata)(skip.CONTEXT_DATA_PROCESSNAME)
local l_0_6 = (skip.get_contextdata)(skip.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_7 = (skip.get_contextdata)(skip.CONTEXT_DATA_FILEPATH)
if l_0_0(l_0_6, "/usr/lib/gcc") and l_0_1(l_0_5, "cc1plus") then
  if l_0_0(l_0_7, "/usr/lib") then
    return 1
  end
  if l_0_0(l_0_7, "/lib") then
    return 1
  end
end
if l_0_0(l_0_7, "/var/log/") then
  if l_0_2(l_0_7, ".log") and (l_0_2(l_0_6, "/nginx") or l_0_2(l_0_6, "/httpd") or l_0_2(l_0_6, "/apache2") or l_0_2(l_0_6, "/mysqld") or l_0_2(l_0_6, "/postgres")) then
    return 1
  end
  if l_0_2(l_0_7, ".journal") and l_0_2(l_0_6, "/systemd-journald") then
    return 1
  end
end
if l_0_0(l_0_5, "hdb") then
  if l_0_0(l_0_7, "/usr/sap") and l_0_2((skip.get_contextdata)(skip.CONTEXT_DATA_FILENAME), ".trc") and l_0_4(l_0_5) then
    return 1
  else
    if ((not l_0_0(l_0_7, "/hana/data") and not l_0_0(l_0_7, "/hana/log")) or (l_0_2((skip.get_contextdata)(skip.CONTEXT_DATA_FILENAME), ".dat") or l_0_1((skip.get_contextdata)(skip.CONTEXT_DATA_FILENAME), "nameserver.lck")) and l_0_4(l_0_5)) then
      return 1
    end
  end
end
if l_0_0(l_0_7, "/hana/shared") and l_0_0((skip.get_contextdata)(skip.CONTEXT_DATA_FILENAME), "log_backup") and l_0_4(l_0_5) then
  return 1
end
if l_0_2(l_0_7, ".TXT") and l_0_2(l_0_6, "/bin/ucxjlx6") then
  return 1
end
if l_0_0(l_0_7, "/proc") then
  local l_0_8 = nil
  local l_0_9, l_0_10, l_0_11, l_0_12 = , (string.find)(l_0_7, "/proc/(%d+)/(%a+)")
  if l_0_10 and (R12_PC216 == "task" or R12_PC216 == "fd") then
    l_0_9 = "^%d+$"
    if l_0_8 ~= nil and (string.find)(l_0_8, l_0_9) then
      return 1
    end
  end
  return 0
end
do
  do
    do
      if l_0_0(l_0_7, "/snap/core") then
        local l_0_13 = nil
        if l_0_7 ~= nil and (string.find)(l_0_7, "/snap/core/(%d+)/dev/core") then
          return 1
        end
      end
      do return 0 end
      -- DECOMPILER ERROR at PC254: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

