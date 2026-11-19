-- Threat: !InfrastructureShared
-- Name: 4178ff9e2b39
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 153600 then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil or l_0_0 == 0 then
    return mp.CLEAN
  end
  for l_0_2 = 1, l_0_0 do
    local l_0_3 = pe.mmap_string_rva(l_0_1[l_0_2].namerva, 64)
    if l_0_3 ~= nil and string.lower(l_0_3) == "dllgetclassobject" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
