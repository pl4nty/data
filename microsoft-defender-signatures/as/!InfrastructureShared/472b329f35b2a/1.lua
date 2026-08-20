-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\472b329f35b2a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.GetCurrentTimeT)()
local l_0_1 = {}
local l_0_2 = ""
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
  l_0_2 = (this_sigattrlog[9]).utf8p1
else
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
    l_0_2 = (this_sigattrlog[10]).utf8p1
  else
    if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
      l_0_2 = (this_sigattrlog[11]).utf8p1
    else
      if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
        l_0_2 = (this_sigattrlog[12]).utf8p1
      else
        if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
          l_0_2 = (this_sigattrlog[13]).utf8p1
        else
          if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p1 ~= nil then
            l_0_2 = (this_sigattrlog[14]).utf8p1
          else
            if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil then
              l_0_2 = (this_sigattrlog[15]).utf8p1
            else
              if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
                l_0_2 = (this_sigattrlog[16]).utf8p1
              else
                if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil then
                  l_0_2 = (this_sigattrlog[17]).utf8p1
                else
                  if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil and (this_sigattrlog[18]).utf8p2 ~= nil then
                    l_0_2 = (this_sigattrlog[18]).utf8p1
                    l_0_1.original_sig = (this_sigattrlog[18]).utf8p2
                  else
                    return mp.CLEAN
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
local l_0_3 = (bm.get_current_process_startup_info)()
local l_0_4 = "memPagesMetadata_" .. l_0_3.ppid
AppendToRollingQueue(l_0_4, "PPID", l_0_3.ppid, 250)
AppendToRollingQueue(l_0_4, "sig_matched", l_0_2, 250)
AppendToRollingQueue(l_0_4, "start_time_procdump_a", l_0_0, 250)
local l_0_5 = (MpCommon.JsonSerialize)(l_0_1)
AppendToRollingQueue(l_0_4, "sig_context_json", l_0_5, 250)
;
(bm.request_SMS)(l_0_3.ppid, "h+")
;
(bm.add_action)("SmsAsyncScanEvent", 0)
;
(bm.add_action)("SmsAsyncScanEvent", 10000)
return mp.INFECTED

