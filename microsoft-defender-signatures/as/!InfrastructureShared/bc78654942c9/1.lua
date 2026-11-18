-- Threat: !InfrastructureShared
-- Name: bc78654942c9
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() > 10 then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.mmap_string_rva(l_0_1[32].namerva, 64)
  if l_0_2 and l_0_2 == "fuckyou" then
    return mp.INFECTED
  end
end
return mp.CLEAN
