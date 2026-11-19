-- Threat: !InfrastructureShared
-- Name: 76783a90c843
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 1 then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 and l_0_2 == "ServiceMain" then
    return mp.INFECTED
  end
end
return mp.CLEAN
