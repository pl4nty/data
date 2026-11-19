-- Threat: !InfrastructureShared
-- Name: 6078a23ad7e7
-- Type: 21

local l_0_0 = mp.hstr_full_log()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.matched and string.byte(pe.mmap_va(l_0_2.VA - 39, 1)) == string.byte(pe.mmap_va(l_0_2.VA - 25, 1)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
