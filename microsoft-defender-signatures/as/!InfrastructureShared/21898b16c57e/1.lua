-- Threat: !InfrastructureShared
-- Name: 21898b16c57e
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EDI)
mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", l_0_0, 2))
return mp.CLEAN
