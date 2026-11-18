-- Threat: !InfrastructureShared
-- Name: !#LUA:TrojanDropper:Win32/Exdrop.gen!A
-- Type: 10
-- MpAttributes: RPF:ContextualDropJavaTemp & (HSTR:VirTool:Win32/Obfuscator_AIM | HSTR:VirTool:Win32/Obfuscator_PN)

if mp.get_contextdata(mp.CONTEXT_DATA_FILENAME) == "notepad.exe" and (pe.get_versioninfo() == nil or pe.get_versioninfo().CompanyName ~= "Microsoft Corporation") then
  return mp.INFECTED
end
return mp.CLEAN
