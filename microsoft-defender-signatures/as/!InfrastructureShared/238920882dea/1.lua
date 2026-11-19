-- Threat: !InfrastructureShared
-- Name: 238920882dea
-- Type: 21

if pe.isvdllbase(pe.get_regval(pe.REG_EBX)) == false then
  return mp.CLEAN
end
local l_0_0 = mp.bitand(pevars.sigaddr + 13 + mp.readu_u32(pe.mmap_va_nofastfail(pevars.sigaddr + 9, 4), 1), 4294967295)
local l_0_1 = pe.mmap_va_nofastfail(l_0_0, 16)
if string.byte(l_0_1, 1) ~= 3 or string.byte(l_0_1, 2) ~= 131 then
  return mp.CLEAN
end
if string.byte(l_0_1, 7) == 135 then
  if string.byte(l_0_1, 8) ~= 210 or string.byte(l_0_1, 9) ~= 233 then
    return mp.CLEAN
  end
elseif string.byte(l_0_1, 7) == 81 then
  if string.byte(l_0_1, 8) ~= 141 or string.byte(l_0_1, 9) ~= 13 or string.byte(l_0_1, 14) ~= 135 or string.byte(l_0_1, 15) ~= 12 then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 2, "d\000\000\000")
pe.mmap_patch_va(l_0_0 + 2, "`\000\000\000")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
