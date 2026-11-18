-- Threat: !InfrastructureShared
-- Name: !#Lua:RData.LogOpcodeV2!func
-- Type: 9
-- MpAttributes: !pea_packed & !pea_isvbpcode & !pea_isvbnative & !pea_ismsil

if pevars.logsize < 16 or mp.getfilesize() > 2048000 or mp.getfilesize() < 10240 or mp.get_mpattribute("Themida_Attr") or mp.get_mpattribute("PEPCODE:VirTool:Win32/VMProtect") or mp.get_mpattribute("Lowfi:HSTR:Win32/Obfuscator.Enigma") or mp.get_mpattribute("SIGATTR:DelphiFile") or mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") or mp.get_mpattribute("HSTR:Win32/DelphiFile") or mp.get_mpattribute("HSTR:CABSFX_RESOURCES") or mp.get_mpattribute("//InnoSetup_Installer") or mp.get_mpattribute("//Lua:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") or mp.get_mpattribute("//SmartInstallMaker") or mp.get_mpattribute("HSTR:Win32/Exprio.gen!lowfi") or mp.get_mpattributesubstring("Molebox") or mp.get_mpattributesubstring("AutoIt") or mp.get_mpattributesubstring("Virus") then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:RData.LogOpcodeV2")
return mp.CLEAN
