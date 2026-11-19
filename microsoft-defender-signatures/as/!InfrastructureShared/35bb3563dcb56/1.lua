-- Threat: !InfrastructureShared
-- Name: 35bb3563dcb56
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
if l_0_1 == nil or #l_0_1 <= 10 then
  return mp.CLEAN
end
if string.find(l_0_1, ".js") ~= nil then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  local l_1_1
  
  local function l_1_2(l_2_0)
    return not l_2_0:match("%.[%a%d]+$")
  end
  
  l_1_1 = l_1_0:match("\"[^\"]*\\node%.exe\"%s+\"([^\"]+)\"") or l_1_0:match("\"[^\"]*\\node%.exe\"%s+'([^']+)'")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  l_1_1 = l_1_0:match("%snode%.exe%s+\"([^\"]+)\"") or l_1_0:match("%snode%.exe%s+'([^']+)'")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  l_1_1 = l_1_0:match("%snode%s+\"([^\"]+)\"") or l_1_0:match("%snode%s+'([^']+)'")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  l_1_1 = l_1_0:match("\"[^\"]*\\node%.exe\"%s+([^%s\"']+)") or l_1_0:match("%snode%.exe%s+([^%s\"']+)") or l_1_0:match("%snode%s+([^%s\"']+)")
  if l_1_1 and l_1_2(l_1_1) then
    return l_1_1
  end
  return nil
end

local l_0_3 = l_0_2(l_0_1)
if l_0_3 == nil then
  return mp.CLEAN
end
if not sysio.IsFolderExists(l_0_3) then
  bm.trigger_sig("SuspNodeJSExecInSpecificFolderC", l_0_3)
  return mp.CLEAN
end
if not StringEndsWith(l_0_3, "\\") then
  l_0_3 = l_0_3 .. "\\"
end
l_0_3 = l_0_3 .. "index.js"
if sysio.IsFileExists(l_0_3) then
  mp.ReportLowfi(l_0_3, 831585867)
  return mp.INFECTED
else
  bm.trigger_sig("SuspNodeJSExecInSpecificFolderB", l_0_3)
end
return mp.CLEAN
