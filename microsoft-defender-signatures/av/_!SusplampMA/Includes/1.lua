-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SusplampMA\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.readu_u32, headerpage, 1)
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
if l_0_1 > 536870912 and l_0_1 < 553648128 then
  (mp.readprotection)(false)
  local l_0_2 = (mp.readfile)(0, 4)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = tostring(l_0_2)
  local l_0_3 = (string.lower)(l_0_2)
  ;
  (mp.readprotection)(true)
  if (string.find)(l_0_3, "rem ", 1, true) ~= nil then
    local l_0_4 = "SusLampz"
    local l_0_5 = 3600
    local l_0_6 = 15
    AppendToRollingQueue(l_0_4, "lampz", 1, l_0_5, l_0_6)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

