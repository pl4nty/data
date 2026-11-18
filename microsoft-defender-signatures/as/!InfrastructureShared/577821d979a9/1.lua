-- Threat: !InfrastructureShared
-- Name: 577821d979a9
-- Type: 21

local l_0_0, l_0_1 = pe.get_exports()
for l_0_2 = 1, l_0_0 do
  local l_0_3 = pe.mmap_string_rva(l_0_1[l_0_2].namerva, 64)
  if l_0_3 == "ServiceMain" then
    return mp.INFECTED
  end
end
return mp.CLEAN
