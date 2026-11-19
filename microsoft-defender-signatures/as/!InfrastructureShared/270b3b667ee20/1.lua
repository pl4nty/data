-- Threat: !InfrastructureShared
-- Name: 270b3b667ee20
-- Type: 21
-- Includes: BMLuaLib

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil then
    return l_1_1
  end
  if l_1_1 == nil then
    return l_1_0
  end
  if l_1_1 < l_1_0 then
    return l_1_1
  end
  return l_1_0
end

local function l_0_1(l_2_0)
  if l_2_0 ~= nil and l_2_0.matched and l_2_0.timestamp ~= nil then
    return l_2_0.timestamp
  end
  return nil
end

local l_0_2 = l_0_1(this_sigattrlog[10])
l_0_2 = l_0_0(l_0_2, l_0_1(this_sigattrlog[11]))
local l_0_3 = l_0_1(this_sigattrlog[12])
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[13]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[14]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[15]))
if l_0_2 == nil or l_0_3 == nil or l_0_2 >= l_0_3 then
  return mp.CLEAN
end

local function l_0_4(l_3_0)
  if l_3_0 ~= nil and l_3_0.matched and l_3_0.utf8p1 ~= nil then
    return l_3_0.utf8p1
  end
  return nil
end

local l_0_5 = l_0_4(this_sigattrlog[10])
if l_0_5 == nil then
  l_0_5 = l_0_4(this_sigattrlog[11])
end

local function l_0_6(l_4_0)
  local l_4_1, l_4_2, l_4_3 = pcall(bm.get_process_relationships)
  if not l_4_1 then
    return false
  end
  for l_4_4, l_4_5 in ipairs(l_4_2 or {}) do
    local l_4_6 = l_4_5.cmd_line or ""
    local l_4_7 = l_4_5.image_path or ""
    if string.find(l_4_6, l_4_0, 1, true) or string.find(l_4_7, l_4_0, 1, true) then
      return true
    end
  end
  for l_4_8, l_4_9 in ipairs(l_4_3 or {}) do
    local l_4_10 = l_4_9.cmd_line or ""
    local l_4_11 = l_4_9.image_path or ""
    if string.find(l_4_10, l_4_0, 1, true) or string.find(l_4_11, l_4_0, 1, true) then
      return true
    end
  end
  return false
end

local l_0_7 = bm.get_current_process_startup_info()
local l_0_8 = l_0_7 ~= nil and l_0_7.command_line or ""
local l_0_9 = mp.GetParentProcInfo()
local l_0_10 = l_0_9 ~= nil and mp.GetProcessCommandLine(l_0_9.ppid) or ""

local function l_0_11(l_5_0)
  return string.find(l_0_8, l_5_0, 1, true) or string.find(l_0_10, l_5_0, 1, true) or l_0_6(l_5_0)
end

local function l_0_12(l_6_0)
  local l_6_1, l_6_2 = pcall(MpCommon.AtomicCounterValue, l_6_0)
  return l_6_1 and l_6_2 ~= nil
end

if l_0_5 ~= nil then
  if l_0_5 == "/tmp/.bash_history" and (l_0_11("-bash") or l_0_11("su - root")) and (l_0_11("unix_chkpwd") or l_0_11("/usr/bin/xauth")) then
    return mp.CLEAN
  end
  if (string.find(l_0_5, "/tmp/body.", 1, true) or string.find(l_0_5, "/tmp/sh-thd-", 1, true)) and l_0_12("linux_ssh_tmp_benign_active") then
    return mp.CLEAN
  end
  if (string.find(l_0_5, "/tmp/hsperfdata_amssys/", 1, true) or string.find(l_0_5, "/tmp/output_fileSsh.tmp.", 1, true) or string.find(l_0_5, "/tmp/ams_replicate_running", 1, true) or string.find(l_0_5, "/tmp/statusSsh.tmp.", 1, true) or string.find(l_0_5, "/tmp/slavestatus.", 1, true) or string.find(l_0_5, "/tmp/site_xml_temp", 1, true)) and l_0_11("amsapp_appserver.sh") then
    return mp.CLEAN
  end
  if string.find(l_0_5, "/tmp/ab_proc/", 1, true) and (l_0_11("/app/abInitio_bin/") or l_0_11("/app/abInitio_work/") or l_0_12("linux_ssh_tmp_benign_active")) then
    return mp.CLEAN
  end
  if string.find(l_0_5, ".cgm", 1, true) and (l_0_11("check_tcp.sh") or l_0_12("linux_ssh_tmp_benign_active")) then
    return mp.CLEAN
  end
  if string.find(l_0_5, "/tmp/body.", 1, true) and l_0_11("sftp_test_sap") then
    return mp.CLEAN
  end
  if string.find(l_0_5, "/tmp/cft", 1, true) and l_0_11("sftp_test_sap") then
    return mp.CLEAN
  end
  if string.find(l_0_5, "/tmp/runAllScripts.tmp", 1, true) and l_0_11("amsapp_appserver.sh") then
    return mp.CLEAN
  end
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
