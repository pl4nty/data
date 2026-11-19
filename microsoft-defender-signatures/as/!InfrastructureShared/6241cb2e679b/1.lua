-- Threat: !InfrastructureShared
-- Name: 6241cb2e679b
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = "rdp-brute-"
local l_0_3 = 100
local l_0_4 = 30
local l_0_5 = 0
local l_0_6 = 10
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched then
  l_0_1 = string.match(this_sigattrlog[3].utf8p1, "Cookie: mstshash=(.*)")
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_7 = l_0_2 .. l_0_0
  local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueCreate, l_0_7, l_0_3, l_0_4, 0)
  if not l_0_8 then
    return mp.CLEAN
  end
  l_0_8, l_0_9 = pcall(MpCommon.RollingQueueAppend, l_0_7, l_0_1, "", l_0_4)
  if not l_0_8 then
    return mp.CLEAN
  end
  l_0_8, l_0_5 = pcall(MpCommon.RollingQueueCount, l_0_7)
  if not l_0_8 then
    return mp.CLEAN
  end
  if l_0_6 <= l_0_5 then
    pcall(MpCommon.RollingQueueErase, l_0_7)
    return mp.INFECTED
  end
end
return mp.CLEAN
