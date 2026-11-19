-- Threat: !InfrastructureShared
-- Name: 36781ccc109e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 4500000 and mp.getfilesize() < 4800000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 ~= nil and l_0_0.OriginalFilename == "DownloaderApp.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
