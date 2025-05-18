-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a7a1_1399.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if (string.find)(l_0_0, "\\werfault.exe", 1, true) or (string.find)(l_0_0, "\\debugger", 1, true) or (string.find)(l_0_0, "\\vmmap", 1, true) or (string.find)(l_0_0, "\\thdump", 1, true) or (string.find)(l_0_0, "\\epa\\gtbinjector", 1, true) or (string.find)(l_0_0, "\\uwpinject.exe", 1, true) or (string.find)(l_0_0, "\\ra64app.exe", 1, true) or (string.find)(l_0_0, "\\bin\\dllinjector64.exe", 1, true) or (string.find)(l_0_0, "\\ftwlaunch", 1, true) then
  return mp.CLEAN
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
  local l_0_1 = (this_sigattrlog[2]).utf8p2
  local l_0_2 = (this_sigattrlog[5]).utf8p1
  local l_0_3 = (string.match)((string.lower)(l_0_1), " -p (%d+)")
  if not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = (string.match)(l_0_2, "targetprocessppid:(%d+):(%d+)")
  if not l_0_4 or not l_0_5 then
    return mp.CLEAN
  end
  if l_0_3 == l_0_4 then
    local l_0_6 = (bm.get_current_process_startup_info)()
    ;
    (bm.request_SMS)(l_0_6.ppid, "M")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1000)
    local l_0_7 = (string.format)("pid:%s,ProcessStart:%s", l_0_4, l_0_5)
    ;
    (bm.trigger_sig)("BMGenericCodeInjector.A", "Behavior:Win32/GenCodeInjector.E", l_0_7)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

