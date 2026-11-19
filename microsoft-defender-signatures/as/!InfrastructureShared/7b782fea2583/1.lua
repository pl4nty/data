-- Threat: !InfrastructureShared
-- Name: 7b782fea2583
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 14 then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.mmap_string_rva(l_0_1[11].namerva, 64)
  if l_0_2 and l_0_2 == "HvncRun" then
    return mp.INFECTED
  end
end
return mp.CLEAN
