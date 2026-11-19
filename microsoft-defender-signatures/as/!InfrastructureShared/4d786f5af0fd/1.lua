-- Threat: !InfrastructureShared
-- Name: 4d786f5af0fd
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll") and mp.getfilesize() < 512000 then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil or l_0_0 == 0 then
    return mp.CLEAN
  end
  local l_0_2 = {
    npgetcaps = true,
    nplogonnotify = true,
    nppasswordchangenotify = true
  }
  local l_0_3 = 0
  for l_0_4 = 1, l_0_0 do
    local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
    if l_0_5 ~= nil and l_0_2[string.lower(l_0_5)] then
      l_0_3 = l_0_3 + 1
    end
    if l_0_3 == 3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
