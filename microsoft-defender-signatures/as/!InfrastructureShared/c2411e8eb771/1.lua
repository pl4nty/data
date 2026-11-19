-- Threat: !InfrastructureShared
-- Name: c2411e8eb771
-- Type: 21

local l_0_0
local l_0_1 = "ssh-brute-"
local l_0_2 = 100
local l_0_3 = 30
local l_0_4 = 0
local l_0_5 = 10
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil then
  local l_0_6 = l_0_1 .. l_0_0
  local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueCreate, l_0_6, l_0_2, l_0_3, 0)
  if not l_0_7 then
    return mp.CLEAN
  end
  l_0_7, l_0_8 = pcall(MpCommon.RollingQueueAppend, l_0_6, "1", "1", l_0_3)
  if not l_0_7 then
    return mp.CLEAN
  end
  l_0_7, l_0_4 = pcall(MpCommon.RollingQueueCount, l_0_6)
  if not l_0_7 then
    return mp.CLEAN
  end
  if l_0_5 <= l_0_4 then
    pcall(MpCommon.RollingQueueErase, l_0_6)
    return mp.INFECTED
  end
end
return mp.CLEAN
