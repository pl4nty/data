-- Threat: !InfrastructureShared
-- Name: 5678084904c9
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 7 then
  local l_0_0, l_0_1 = pe.get_exports()
  local l_0_2 = pe.mmap_string_rva(l_0_1[3].namerva, 64)
  if l_0_2 == "IsPayloadRunning" then
    return mp.INFECTED
  end
end
return mp.CLEAN
