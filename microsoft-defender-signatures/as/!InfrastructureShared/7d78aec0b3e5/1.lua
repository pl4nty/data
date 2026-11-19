-- Threat: !InfrastructureShared
-- Name: 7d78aec0b3e5
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 4600000 and mp.getfilesize() < 4900000 and pe.get_exports_count() == 194 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "yMvcBRVKRSk" then
    return mp.INFECTED
  end
end
return mp.CLEAN
