-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b352547908\0x0000119e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (string.lower)(l_0_0.command_line)
local l_0_2 = (string.lower)((bm.get_imagepath)())
if l_0_2 == nil or #l_0_2 < 1 then
  return mp.CLEAN
end
if (string.find)((string.lower)(l_0_2), "\\program files", 1, true) or (string.find)((string.lower)(l_0_2), "\\system32", 1, true) then
  return mp.CLEAN
end
if l_0_1 == nil or #l_0_1 < 1 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\program files", 1, true) or (string.find)(l_0_1, "system32", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

