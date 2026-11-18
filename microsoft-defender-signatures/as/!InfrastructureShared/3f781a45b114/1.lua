-- Threat: !InfrastructureShared
-- Name: 3f781a45b114
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 4 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[4].namerva, 64)
  if l_0_2 == "_sfwjb_jcky" then
    return mp.INFECTED
  end
end
return mp.CLEAN
