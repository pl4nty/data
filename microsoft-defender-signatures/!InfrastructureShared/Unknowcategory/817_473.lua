-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\817_473.luac 

-- params : ...
-- function num : 0
local l_0_2 = nil
do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = (bm.get_current_process_startup_info)()
  end
  if l_0_2.utf8p1 == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if (sysio.GetFileSize)(l_0_2.utf8p1) < 10485760 and l_0_3 ~= nil and l_0_3.ppid ~= nil then
    (bm.request_SMS)(l_0_3.ppid, "m")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

