-- Threat: !InfrastructureShared
-- Name: 5bb3f1136715
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
if l_0_1 == nil or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_2 == nil or #l_0_2 <= 2 then
  return mp.CLEAN
end

local function l_0_3(l_1_0)
  local l_1_1
  
  local function l_1_2(l_2_0)
    return not l_2_0:match("[/\\]") and l_2_0:match("^%w[%w%._%-]*%.[%a%d]+$")
  end
  
  l_1_1 = l_1_0:match("\"[^\"]*\\node%.exe\"%s+\"([^\"]+)\"") or l_1_0:match("%snode%.exe%s+\"([^\"]+)\"") or l_1_0:match("%snode%s+\"([^\"]+)\"")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  l_1_1 = l_1_0:match("\"[^\"]*\\node%.exe\"%s+([^%s]+)") or l_1_0:match("%snode%.exe%s+([^%s]+)") or l_1_0:match("%snode%s+([^%s]+)")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  return nil
end

local l_0_4 = l_0_3(l_0_1)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_2 .. l_0_4
if sysio.IsFileExists(l_0_5) then
  mp.ReportLowfi(l_0_5, 1442354168)
  return mp.INFECTED
else
  bm.trigger_sig("SuspNodeJSExecInCurrentFolderCB", l_0_5)
end
return mp.CLEAN
