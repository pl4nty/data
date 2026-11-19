-- Threat: !InfrastructureShared
-- Name: 229559aa7341
-- Type: 21

local l_0_0 = pevars.sigaddr
local l_0_1 = pe.mmap_va(l_0_0 + 2287, 32)
if mp.readu_u32(l_0_1, 1) ~= 1935939071 or mp.readu_u32(l_0_1, 5) ~= 3277652040 or mp.readu_u16(l_0_1, 9) == 52428 or mp.readu_u32(l_0_1, 11) == 3435973836 or mp.readu_u32(l_0_1, 15) == 3435973836 or mp.readu_u32(l_0_1, 18) == 3435973836 or mp.readu_u32(l_0_1, 22) ~= 1098924136 then
  mp.set_mpattribute("PEBMPAT:VirTool:Win32/Autoit!obfuscated")
  return mp.CLEAN
end
return mp.SUSPICIOUS
