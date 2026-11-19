-- Threat: !InfrastructureShared
-- Name: 4078fe0808c3
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
