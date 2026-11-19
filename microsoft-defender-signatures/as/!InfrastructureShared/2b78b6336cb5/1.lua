-- Threat: !InfrastructureShared
-- Name: 2b78b6336cb5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1600000 and mp.getfilesize() < 1700000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
