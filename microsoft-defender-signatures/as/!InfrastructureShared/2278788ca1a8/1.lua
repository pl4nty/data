-- Threat: !InfrastructureShared
-- Name: 2278788ca1a8
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 900000 and mp.getfilesize() < 3300000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 ~= nil and l_0_0.OriginalFilename == "sxstrace.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
