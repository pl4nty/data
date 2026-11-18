-- Threat: !InfrastructureShared
-- Name: 7178d6658b60
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.no_exports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if 1 < l_0_0 then
  for l_0_2 = 1, l_0_0 do
    local l_0_3 = pe.mmap_string_rva(l_0_1[l_0_2].namerva, 64)
    if string.lower(l_0_3) == "rathbuige" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
