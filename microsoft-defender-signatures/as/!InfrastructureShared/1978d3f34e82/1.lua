-- Threat: !InfrastructureShared
-- Name: 1978d3f34e82
-- Type: 21

if hstrlog[1].matched or hstrlog[2].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_56CB")
end
return mp.INFECTED
