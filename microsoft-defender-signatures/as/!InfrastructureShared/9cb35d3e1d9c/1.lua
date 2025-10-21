-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb35d3e1d9c\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p1 or not (this_sigattrlog[4]).utf8p2 then
  return mp.CLEAN
end
local l_0_0 = tonumber((this_sigattrlog[4]).utf8p2)
if l_0_0 > 0 then
  local l_0_1 = (bm.get_current_process_startup_info)()
  do
    do
      if l_0_1 and next(l_0_1) and l_0_1.command_line then
        local l_0_2 = (string.lower)(l_0_1.command_line)
        bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
        ;
        (bm.request_SMS)(l_0_1.ppid, "h+")
        ;
        (bm.add_action)("SmsAsyncScanEvent", 1)
        ;
        (bm.add_related_string)("[->] MEDICATED SCRIPT: ", l_0_2, bm.RelatedStringBMReport)
        ;
        (bm.add_related_file)(l_0_2)
      end
      triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/AmsiInitFailed.MK")
      add_parents()
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

