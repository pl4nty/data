-- Threat: !InfrastructureShared
-- Name: 768925f2b4f3
-- Type: 21

function offset2bin(l_1_0)
  return string.format("%c%c%c%c", mp.bitand(l_1_0, 255), mp.bitand(mp.shr32(l_1_0, 8), 255), mp.bitand(mp.shr32(l_1_0, 16), 255), mp.bitand(mp.shr32(l_1_0, 24), 255))
end

local l_0_0 = 33
if string.byte(pe.mmap_va(pevars.sigaddr + 16, 1)) == 131 then
  l_0_0 = 30
end
if mp.bitand(mp.readu_u32(pe.mmap_va(pevars.sigaddr - 4, 4), 1), 16777215) == 15401588 then
  pe.mmap_patch_va(pevars.sigaddr - 2, "\144\144")
end
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 256)
local l_0_2 = string.find(l_0_1, "\139U\252", 1, true)
if l_0_2 ~= nil then
  pe.mmap_patch_va(pevars.sigaddr + l_0_0, "\235")
  pe.mmap_patch_va(pevars.sigaddr + l_0_0 + 1, offset2bin(l_0_2 - 3))
  return mp.INFECTED
end
return mp.CLEAN
