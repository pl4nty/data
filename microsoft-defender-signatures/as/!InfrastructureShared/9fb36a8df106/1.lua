-- Threat: !InfrastructureShared
-- Name: 9fb36a8df106
-- Type: 21
-- Includes: WinRMSessionInfra

local l_0_0 = "PSRemoting"
local l_0_1 = "wsmprovhost"
if this_sigattrlog[2] ~= nil and this_sigattrlog[2].matched then
  l_0_0 = "WinRS"
  l_0_1 = "winrshost"
end
WinRMSessionTrackProcess("BM", l_0_0, "HostedShell")
SetWinRMSessionMetadata("BM", "host", l_0_1)
SetWinRMSessionMetadata("BM", "transport", "wsman")
local l_0_2, l_0_3, l_0_4 = pcall(bm.get_process_relationships)
if l_0_2 and l_0_4 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if l_0_6.image_path ~= nil and l_0_6.ppid ~= nil then
      WinRMSessionTrackProcess(l_0_6.ppid, l_0_0, "Descendant")
    end
  end
end
return mp.CLEAN
