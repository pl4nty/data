-- Threat: !InfrastructureShared
-- Name: 14bb32f592d62
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[5]
if not (l_0_2 and l_0_2.matched) or not l_0_2.utf8p2 then
  return mp.CLEAN
end
l_0_2 = l_0_2.utf8p2
local l_0_3, l_0_4 = l_0_2:match("^(%d+);regionsize:(%d+);")
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
if tonumber(l_0_4) > 2048 then
  return mp.CLEAN
end
local l_0_5 = l_0_2:match("(%w+.dll)$")
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcall(bm.GetModAddress, l_0_1, l_0_5)
if not l_0_6 or not l_0_7 then
  return mp.CLEAN
end
if l_0_3 ~= l_0_7 then
  return mp.CLEAN
end
return mp.INFECTED
