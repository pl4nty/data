-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a47f_590.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched then
  local l_0_0 = (string.match)((this_sigattrlog[5]).utf8p1, "imagepath:(.*)")
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = (sysio.GetPEVersionInfo)(l_0_0)
  if l_0_1 and (string.lower)(l_0_1.OriginalFilename) == "autoit3.exe" then
    local l_0_2 = (bm.get_current_process_startup_info)()
    ;
    (bm.request_SMS)(l_0_2.ppid, "M")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

