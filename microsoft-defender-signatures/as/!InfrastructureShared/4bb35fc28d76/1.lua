-- Threat: !InfrastructureShared
-- Name: 4bb35fc28d76
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil or #l_0_0 < 12 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
local l_0_2 = {
  [".exe"] = true,
  [".scr"] = true,
  [".dll"] = true,
  [".com"] = true,
  [".bat"] = true,
  [".cmd"] = true,
  [".cpl"] = true,
  [".ocx"] = true,
  [".ps1"] = true,
  [".vbs"] = true,
  [".jse"] = true,
  [".vbe"] = true,
  [".wsf"] = true,
  [".wsh"] = true
}
if l_0_2[l_0_1] == nil or string.sub(l_0_0, -3) ~= ".js" then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil or l_0_3.ppid == nil then
  return mp.CLEAN
end
local l_0_4 = tonumber(string.match(l_0_3.ppid, "pid:(%w+),ProcessStart:%w+"))
if l_0_4 ~= nil and l_0_4 <= 4 then
  MpCommon.AppendPersistContext(l_0_0, "SystemDropToUserProfile.A", 1800)
  return mp.INFECTED
end
return mp.CLEAN
