-- Threat: !InfrastructureShared
-- Name: !#TELPER:SuspiciousDll.A
-- Type: 8
-- MpAttributes: pea_isdll & !pea_no_exports

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 1 then
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if string.lower(l_0_2) == "exec" then
    return mp.INFECTED
  end
end
return mp.CLEAN
