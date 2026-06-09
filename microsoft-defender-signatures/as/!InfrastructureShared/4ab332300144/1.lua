-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab332300144\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PyArmorRQ"
local l_0_1 = (this_sigattrlog[1]).utf8p1
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
if not isnull(l_0_2) then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_0, l_0_1, 1, 86400)
local l_0_3 = (bm.get_current_process_startup_info)()
;
(bm.request_SMS)(l_0_3.ppid, "l+")
;
(bm.add_action)("SmsAsyncScanEvent", 2000)
return mp.INFECTED

