-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\209b3ec513d8d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if l_0_0 and next(l_0_0) and l_0_0.command_line then
    local l_0_1 = (string.lower)(l_0_0.command_line)
    bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
    ;
    (bm.request_SMS)(l_0_0.ppid, "M")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

