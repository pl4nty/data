-- Threat: !InfrastructureShared
-- Name: a978c40bec73
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 10 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[5].namerva, 64)
  if l_0_2 == "_Z16GetInfectionInfoP15_INFECTION_INFO" then
    return mp.INFECTED
  end
end
return mp.CLEAN
