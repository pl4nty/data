-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000012c4_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
  l_0_0 = (string.gsub)(l_0_0, "\"", "")
  l_0_0 = (string.gsub)(l_0_0, "%s+$", "")
  local l_0_1 = (string.lower)((this_sigattrlog[4]).utf8p2)
  if l_0_0 == l_0_1 then
    local l_0_2 = (bm.get_current_process_startup_info)()
    ;
    (bm.request_SMS)(l_0_2.ppid, "M")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 3000)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

