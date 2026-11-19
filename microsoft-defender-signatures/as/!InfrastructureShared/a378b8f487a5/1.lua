-- Threat: !InfrastructureShared
-- Name: a378b8f487a5
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 46 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[4].namerva, 64)
  if l_0_2 == "injection_initialize" then
    return mp.INFECTED
  end
end
return mp.CLEAN
