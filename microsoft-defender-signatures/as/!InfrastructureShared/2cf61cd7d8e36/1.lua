-- Threat: !InfrastructureShared
-- Name: 2cf61cd7d8e36
-- Type: 21

if peattributes.isdll == true then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 and l_0_2 == "MyCurlEasyInit" then
    return mp.INFECTED
  end
end
return mp.CLEAN
