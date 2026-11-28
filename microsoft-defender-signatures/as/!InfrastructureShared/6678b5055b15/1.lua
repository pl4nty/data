-- Threat: !InfrastructureShared
-- Name: 6678b5055b15
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 14 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[5].namerva, 64)
  if l_0_2 == "JLI_Launch" then
    return mp.INFECTED
  end
end
return mp.CLEAN
