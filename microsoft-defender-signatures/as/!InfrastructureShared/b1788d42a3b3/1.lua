-- Threat: !InfrastructureShared
-- Name: b1788d42a3b3
-- Type: 21

local l_0_0 = string.format("HSTR:VirTool:Win32/Obfuscator.ZG!upk.1_%08X_%08X", hstrlog[1].VA, hstrlog[2].VA)
mp.set_mpattribute(l_0_0)
return mp.SUSPICIOUS
