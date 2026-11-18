-- Threat: !InfrastructureShared
-- Name: 2089c02650f3
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 7, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
l_0_0 = pe.mmap_va(l_0_1, 4)
l_0_1 = mp.readu_u32(l_0_0, 1)
local l_0_2 = pe.get_api_id(l_0_1)
if pe.query_import(pe.IMPORT_STATIC, 1753664949) and pe.query_import(pe.IMPORT_STATIC, 4207106400) and l_0_2 == 3141119381 then
  mp.set_mpattribute("FOP:VirTool:Win32/Obfuscator.Fareit")
end
return mp.LOWFI
