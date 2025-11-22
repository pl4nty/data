-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a9b38ddf3a5f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
l_0_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_1["313091c0-1f10-4d61-9655-068742b3534f"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(GetRollingQueue, "evil_queue")
if not l_0_2 or isnull(l_0_3) then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p1 or not (this_sigattrlog[4]).utf8p2 then
  return mp.CLEAN
end
local l_0_4 = (this_sigattrlog[4]).utf8p1
local l_0_5 = (this_sigattrlog[4]).utf8p2
if #l_0_5 >= 500 then
  local l_0_6 = (string.lower)(l_0_4)
  for l_0_10,l_0_11 in ipairs(l_0_3) do
    if (string.find)(l_0_6, tostring(l_0_11.key)) then
      return mp.INFECTED
    end
  end
end
do
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end

