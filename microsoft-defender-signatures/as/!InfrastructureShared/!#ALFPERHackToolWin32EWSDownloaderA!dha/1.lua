-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Win32/EWSDownloader.A!dha
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  local l_0_1 = {
    ["IGOR_UI.exe"] = "",
    ["IGOR_Core.dll"] = "",
    ["IGOR.Interface.CLI.exe"] = ""
  }
  if l_0_1[l_0_0.OriginalFilename] then
    return mp.INFECTED
  end
end
return mp.CLEAN
