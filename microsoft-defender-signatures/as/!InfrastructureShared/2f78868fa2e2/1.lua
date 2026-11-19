-- Threat: !InfrastructureShared
-- Name: 2f78868fa2e2
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 4100000 and mp.getfilesize() < 4200000 then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
