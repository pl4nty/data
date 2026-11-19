-- Threat: !InfrastructureShared
-- Name: 4778c100836b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1800000 and mp.getfilesize() < 2500000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 ~= nil and l_0_0.InternalName == "TJprojMain" then
    return mp.INFECTED
  end
end
return mp.CLEAN
