-- Threat: !InfrastructureShared
-- Name: cfb338d7964c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil then
      bm.request_SMS(l_0_3.ppid, "H")
      bm.add_action("SmsAsyncScanEvent", 5000)
      TrackPidAndTechniqueBM(l_0_3.ppid, "T1133", "remote_access_tool_childproc")
      triggerMemQueryOnProcess(l_0_3.ppid, "Behavior:Win32/ActiveConnToAttackerServer.C", "remote_access_tool_childproc")
    end
  end
end
return mp.INFECTED
