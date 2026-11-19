-- Threat: !InfrastructureShared
-- Name: 2995aa251426
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EDI) - 262148
if l_0_0 == 7749888 then
  pe.mmap_patch_va(l_0_0, "h\000Az\000\195")
end
return mp.INFECTED
