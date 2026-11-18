-- Threat: !InfrastructureShared
-- Name: 2b788ab6151f
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 1 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "ASFVERW" then
    return mp.INFECTED
  end
end
return mp.CLEAN
