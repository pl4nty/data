-- Threat: !InfrastructureShared
-- Name: 9cb3261ac914
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = "Env-" .. l_0_0.ppid
if GetRollingQueue(l_0_1) ~= nil then
  return mp.INFECTED
end
local l_0_2, l_0_3 = string.match(l_0_0.ppid, "pid:(%w+),ProcessStart:(%w+)")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_4 = "/proc/" .. l_0_2 .. "/environ"
if not sysio.IsFileExists(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = sysio.ReadFile(l_0_4, 0, 8192)
if not sysio.GetLastResult().Success then
  return mp.CLEAN
end
local l_0_6 = StringSplit(l_0_5, "%z")
for l_0_7, l_0_8 in ipairs(l_0_6) do
  local l_0_9 = string.find(l_0_8, "=", 1, true)
  local l_0_10 = string.sub(l_0_8, 1, l_0_9 - 1)
  local l_0_11 = string.sub(l_0_8, l_0_9 + 1)
  AppendToRollingQueue(l_0_1, l_0_10, l_0_11)
  if l_0_10 == "LD_PRELOAD" or l_0_10 == "LD_LIBRARY_PATH" or l_0_10 == "LD_AUDIT" then
    bm.trigger_sig("EnvVar:" .. l_0_10, l_0_11)
  end
end
return mp.INFECTED
