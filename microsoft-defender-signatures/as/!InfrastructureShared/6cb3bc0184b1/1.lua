-- Threat: !InfrastructureShared
-- Name: 6cb3bc0184b1
-- Type: 21

local l_0_0
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
      if string.find(l_0_0, "\\taniumclient.exe", -17, true) or string.find(l_0_0, "\\wbem\\wmiprvse.exe", -18, true) or string.find(l_0_0, "\\microsoft intune management extension\\agentexecutor.exe", -56, true) or string.find(l_0_0, "\\netlogon\\mdatp\\windowsdefenderatponboardingscript.cmd", -54, true) or string.find(l_0_0, "\\qualysagent\\qualysagent.exe", -28, true) or string.find(l_0_0, "\\quest\\kace\\kdeploy.exe", -23, true) or string.find(l_0_0, "\\windows defender advanced threat protection\\senseir.exe", -56, true) or string.find(l_0_0, "\\sng\\abtsngsvc.exe", -18, true) then
        return mp.CLEAN
      end
    end
    if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
      bm.add_related_file(l_0_0)
    end
  end
end
return mp.INFECTED
