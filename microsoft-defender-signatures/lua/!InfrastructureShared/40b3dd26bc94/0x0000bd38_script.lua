-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\40b3dd26bc94\0x0000bd38_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.sub)(l_0_0, -10)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
if l_0_2 == "\\mshta.exe" then
  local l_0_3 = (bm.get_current_process_startup_info)()
  if isnull(l_0_3) then
    return mp.CLEAN
  end
  local l_0_4 = l_0_3.command_line
  if (string.find)(l_0_4, "-embedding", 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

