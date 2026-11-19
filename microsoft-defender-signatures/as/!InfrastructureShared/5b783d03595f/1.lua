-- Threat: !InfrastructureShared
-- Name: 5b783d03595f
-- Type: 21

if (mp.get_mpattribute("pea_isexe") or mp.get_mpattribute("pea_isdll")) and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
