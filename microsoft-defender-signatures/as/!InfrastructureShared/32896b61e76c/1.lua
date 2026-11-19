-- Threat: !InfrastructureShared
-- Name: 32896b61e76c
-- Type: 21

if not mp.get_mpattribute("lua_codepatch_urausy_lod") then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(pe.mmap_va(pevars.sigaddr + 23, 4), 1)
if 131072 <= l_0_0 then
  pe.mmap_patch_va(pevars.sigaddr + 23, "\000\000\000\000")
end
return mp.INFECTED
