-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b33a38bba4\0x0000c303_luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
    local l_0_1 = (string.lower)(l_0_0.command_line)
    if (string.find)(l_0_1, "svchost.exe -k camera -s frameserver", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_2 = (string.lower)((bm.get_imagepath)())
  if l_0_2 then
    if (string.find)(l_0_2, "\\python", 1, true) then
      return mp.INFECTED
    end
    if (string.find)(l_0_2, "\\program files", 1, true) or (string.find)(l_0_2, "\\microsoft vs code\\", 1, true) or (string.find)(l_0_2, "microsoft.watson", 1, true) or (string.find)(l_0_2, "mpsigstub.exe", 1, true) or (string.find)(l_0_2, "\\te.exe", 1, true) or (string.find)(l_0_2, "\\te.processhost.exe", 1, true) or (string.find)(l_0_2, "virtualboxvm.exe", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

