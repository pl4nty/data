-- Threat: !InfrastructureShared
-- Name: !#Trojan:Win32/SirefefDllInstaller
-- Type: 8

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if mp.get_contextdata(mp.CONTEXT_DATA_FILENAME) == "msimg32.dll" and string.lower(string.sub(l_0_0, -5, -1)) == "\\temp" and pe.get_versioninfo().CompanyName ~= "Microsoft Corporation" then
    return mp.LOWFI
  end
end
return mp.CLEAN
