-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a9b38ddf3a5f\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(GetRollingQueue, "evil_queue")
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p1 or not (this_sigattrlog[4]).utf8p2 then
  return mp.CLEAN
end
local l_0_2 = (this_sigattrlog[4]).utf8p1
local l_0_3 = (this_sigattrlog[4]).utf8p2
if #l_0_3 >= 500 then
  local l_0_4 = (string.lower)(l_0_2)
  for l_0_8,l_0_9 in ipairs(l_0_1) do
    if (string.find)(l_0_4, tostring(l_0_9.key)) then
      return mp.INFECTED
    end
  end
end
do
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end

