-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\cfb338d7964c\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_1 ~= nil then
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    if l_0_6.image_path ~= nil and l_0_6.ppid ~= nil then
      (bm.request_SMS)(l_0_6.ppid, "H")
      ;
      (bm.add_action)("SmsAsyncScanEvent", 5000)
      TrackPidAndTechniqueBM(l_0_6.ppid, "T1133", "remote_access_tool_childproc")
      triggerMemQueryOnProcess(l_0_6.ppid, "Behavior:Win32/ActiveConnToAttackerServer.C", "remote_access_tool_childproc")
    end
  end
end
do
  return mp.INFECTED
end

