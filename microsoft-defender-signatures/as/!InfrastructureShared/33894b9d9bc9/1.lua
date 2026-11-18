-- Threat: !InfrastructureShared
-- Name: 33894b9d9bc9
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = pe.mmap_va(pe.get_regval(pe.REG_EAX), 4)
local l_0_1 = string.byte(l_0_0) - 1
local l_0_2 = string.byte(l_0_0, 3) + 16
pe.mmap_patch_va(pe.get_regval(pe.REG_EAX), string.char(l_0_1))
pe.mmap_patch_va(pe.get_regval(pe.REG_EAX) + 2, string.char(l_0_2))
return mp.INFECTED
