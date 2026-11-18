-- Threat: !InfrastructureShared
-- Name: 230b3a1a3a06e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_1 = sysio.GetFileSize(l_0_0)
if not sysio.GetLastResult().Success then
  return mp.CLEAN
end
l_0_1 = 65536 < l_0_1 and 65536 or l_0_1
local l_0_2 = sysio.ReadFile(l_0_0, 0, l_0_1)
if not sysio.GetLastResult().Success then
  return mp.CLEAN
end
local l_0_3 = crypto.Sha256Buffer(l_0_2, 0, l_0_1)
if GetRollingQueueKeyValue("GPO-ScheduledTasks-LocalPath-Current", l_0_0) == l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8
local l_0_9 = {}

local function l_0_10(l_1_0, l_1_1, l_1_2, l_1_3)
  if not l_1_2 and not l_1_3 then
    return
  end
  local l_1_4 = string.format("%s %s", l_1_2 or "", l_1_3 or "")
  local l_1_5 = sysio.CommandLineScan(l_1_4, 0)
  local l_1_6 = mp.GetExecutablesFromCommandLine(l_1_4)
  for l_1_7, l_1_8 in ipairs(l_1_6) do
    if sysio.IsFileExists(l_1_8) then
      bm.add_related_file(l_1_8)
    end
  end
  l_1_4 = MpCommon.NormalizeString(l_1_4, "CmdLineNormalizationStandard")
  l_1_4 = l_1_4 and crypto.Sha256Buffer(l_1_4, 0, #l_1_4) or "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  l_0_9[#l_0_9 + 1] = {
    task_uid = crypto.Sha1Buffer(l_1_0, 0, #l_1_0),
    changed_time = l_1_1,
    cmdline = l_1_4,
    scan_result = l_1_5 or false
  }
end

local function l_0_11(l_2_0, l_2_1, l_2_2)
  if l_2_2 and l_2_1 then
    error("unexpected text in tag with attributes")
  elseif not l_0_4 then
    if l_2_0 == "Task" or l_2_0 == "ImmediateTask" then
      l_0_4 = 1
      l_0_5 = l_2_1.uid or ""
      l_0_6 = l_2_1.changed or ""
    elseif l_2_0 == "TaskV2" or l_2_0 == "ImmediateTaskV2" then
      l_0_4 = 2
      l_0_5 = l_2_1.uid or ""
      l_0_6 = l_2_1.changed or ""
    end
  elseif l_0_4 == 1 then
    if l_2_0 == "Properties" then
      l_0_7 = l_2_1.appName
      l_0_8 = l_2_1.args
    end
  elseif l_0_4 == 2 then
    if l_2_0 == "Command" then
      l_0_7 = l_2_2
    elseif l_2_0 == "Arguments" then
      l_0_8 = l_2_2
    end
  end
end

local function l_0_12(l_3_0)
  if not l_0_4 then
    return
  end
  if l_0_4 == 1 then
    if l_3_0 == "Task" or l_3_0 == "ImmediateTask" then
      l_0_10(l_0_5, l_0_6, l_0_7, l_0_8)
      l_0_7, l_0_8 = nil, nil
      l_0_4 = nil
      l_0_5 = nil
    end
  elseif l_0_4 == 2 then
    if l_3_0 == "Exec" then
      l_0_10(l_0_5, l_0_6, l_0_7, l_0_8)
      l_0_7, l_0_8 = nil, nil
    elseif l_3_0 == "TaskV2" or l_3_0 == "ImmediateTaskV2" then
      l_0_4 = nil
      l_0_5 = nil
    end
  end
end

local l_0_13, l_0_14 = pcall(parseXML, l_0_2, l_0_11, l_0_12)
if not l_0_13 then
  bm.add_related_string("GPO-scheduledtasks-error", l_0_14, bm.RelatedStringBMReport)
  return mp.INFECTED
end
local l_0_15 = l_0_0:lower():match("{([0-9a-f\\-]+)}")
local l_0_16 = {
  gpo_guid = crypto.Sha1Buffer(l_0_15, 0, #l_0_15),
  command_lines = l_0_9
}
bm.add_related_string("GPO-scheduledtasks-info", safeJsonSerialize(l_0_16), bm.RelatedStringBMReport)
AppendToRollingQueue("GPO-ScheduledTasks-LocalPath-Current", l_0_0, l_0_3, 604800, 300, 1)
return mp.INFECTED
