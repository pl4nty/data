-- Threat: !InfrastructureShared
-- Name: 2c9b373ce9a99
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 and contains(l_0_1, "TiWorker") then
  return mp.CLEAN
else
  local l_0_2 = {
    {"", "TiWorker"},
    {
      "TiWorker.exe",
      ""
    }
  }
  if checkParentCmdlineCaseInsensitive(l_0_0.ppid, l_0_2, 5) then
    return mp.CLEAN
  end
end
if this_sigattrlog[6].matched and not string.find(this_sigattrlog[6].p1, "Windows-SenseClient-FoD-Package", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
