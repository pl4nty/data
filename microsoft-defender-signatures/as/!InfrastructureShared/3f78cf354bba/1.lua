-- Threat: !InfrastructureShared
-- Name: 3f78cf354bba
-- Type: 21

if peattributes.isdll == true then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.mmap_string_rva(l_0_1[2].namerva, 64)
  if l_0_2 and l_0_2 == "LogSetOption" then
    return mp.INFECTED
  end
end
return mp.CLEAN
