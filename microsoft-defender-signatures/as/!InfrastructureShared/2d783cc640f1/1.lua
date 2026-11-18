-- Threat: !InfrastructureShared
-- Name: 2d783cc640f1
-- Type: 21

if mp.get_mpattribute("pea_isdll") and pe.get_exports_count() <= 5 and pe.get_exports_count() >= 1 then
  local l_0_0, l_0_1 = pe.get_imports()
  if l_0_0 <= 5 and 1 <= l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
