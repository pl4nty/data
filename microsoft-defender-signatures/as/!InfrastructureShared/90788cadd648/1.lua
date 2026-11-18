-- Threat: !InfrastructureShared
-- Name: 90788cadd648
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 2 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "ServiceMain" then
    return mp.INFECTED
  end
end
return mp.CLEAN
