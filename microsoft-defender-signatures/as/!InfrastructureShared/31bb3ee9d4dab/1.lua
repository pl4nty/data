-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31bb3ee9d4dab\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.GetCurrentTimeT)()
local l_0_1 = ""
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
  l_0_1 = (this_sigattrlog[7]).utf8p1
else
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
    l_0_1 = (this_sigattrlog[8]).utf8p1
  else
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      l_0_1 = (this_sigattrlog[9]).utf8p1
    else
      if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
        l_0_1 = (this_sigattrlog[10]).utf8p1
      else
        if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
          l_0_1 = (this_sigattrlog[11]).utf8p1
        else
          if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
            l_0_1 = (this_sigattrlog[12]).utf8p1
          else
            return mp.CLEAN
          end
        end
      end
    end
  end
end
local l_0_2 = (bm.get_current_process_startup_info)()
local l_0_3 = "memPagesMetadata_" .. l_0_2.ppid
AppendToRollingQueue(l_0_3, "PPID", l_0_2.ppid, 250)
AppendToRollingQueue(l_0_3, "sig_matched", l_0_1, 250)
AppendToRollingQueue(l_0_3, "start_time_procdump_a", l_0_0, 250)
;
(bm.request_SMS)(l_0_2.ppid, "h+")
;
(bm.add_action)("SmsAsyncScanEvent", 0)
;
(bm.add_action)("SmsAsyncScanEvent", 10000)
return mp.INFECTED

