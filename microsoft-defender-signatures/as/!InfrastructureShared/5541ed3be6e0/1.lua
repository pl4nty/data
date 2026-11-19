-- Threat: !InfrastructureShared
-- Name: 5541ed3be6e0
-- Type: 21

local l_0_0, l_0_1, l_0_2
local l_0_3 = "ftp-brute-"
local l_0_4 = 30
local l_0_5 = 60
local l_0_6 = 0
local l_0_7 = 10
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_2 ~= nil then
  local l_0_8 = l_0_3 .. l_0_0 .. "-" .. l_0_1
  local l_0_9, l_0_10 = pcall(MpCommon.RollingQueueCreate, l_0_8, l_0_4, l_0_5, 1)
  if not l_0_9 then
    return mp.CLEAN
  end
  l_0_9, l_0_10 = pcall(MpCommon.RollingQueueAppend, l_0_8, l_0_2, "", l_0_5)
  if not l_0_9 then
    return mp.CLEAN
  end
  l_0_9, l_0_6 = pcall(MpCommon.RollingQueueCount, l_0_8)
  if not l_0_9 then
    return mp.CLEAN
  end
  if l_0_7 <= l_0_6 then
    pcall(MpCommon.RollingQueueErase, l_0_8)
    return mp.INFECTED
  end
end
return mp.CLEAN
