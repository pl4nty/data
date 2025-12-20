-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\105d79652730b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("^%S+%s+%S+%s+(%S+)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6 = l_0_2:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
if not l_0_3 then
  return mp.CLEAN
end
for l_0_10,l_0_11 in ipairs({l_0_3, l_0_4, l_0_5, l_0_6}) do
  local l_0_12 = tonumber(l_0_11)
  if not l_0_12 or l_0_12 < 0 or l_0_12 > 255 then
    return mp.CLEAN
  end
end
local l_0_13 = l_0_1:match("^%S+%s+%S+%s+%S+%s+(%S+)")
if not l_0_13 then
  return mp.CLEAN
end
l_0_13 = tonumber(l_0_13)
if l_0_13 < 0 or l_0_13 > 65535 then
  return mp.CLEAN
end
return mp.INFECTED

