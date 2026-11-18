-- Threat: !InfrastructureShared
-- Name: 5a789c4562a1
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 2 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "Print" then
    return mp.INFECTED
  end
end
return mp.CLEAN
