-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b34f46c82f\1.luac 

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
  return mp.INFECTED
end

