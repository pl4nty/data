-- Threat: !InfrastructureShared
-- Name: 24890537293b
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EBX)
local l_0_1 = pe.get_api_id(l_0_0)
if l_0_1 == 1269389306 then
  mp.set_mpattribute("lua_codepatch_Obfuscator.zg")
  pe.mmap_patch_va(pevars.sigaddr + 16, "\144\144")
end
return mp.CLEAN
