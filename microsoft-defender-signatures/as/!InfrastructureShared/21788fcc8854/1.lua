-- Threat: !InfrastructureShared
-- Name: 21788fcc8854
-- Type: 21

function getrawu32(l_1_0)
  mp.readprotection(false)
  
  return mp.readu_u32(mp.readfile(pe.foffset_va(l_1_0), 4), 1)
end

if hstrlog[1].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!xor_plus.1_0A")
  local l_0_0
  l_0_0 = getrawu32(hstrlog[1].VA + 1328)
  if l_0_0 == 2537292765 then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_6DF1")
  end
elseif hstrlog[2].matched then
  local l_0_1
  l_0_1 = getrawu32(hstrlog[2].VA + 667)
  if l_0_1 == 87682159 then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!xor_plus.1_0D")
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_6FF3")
  end
end
return mp.CLEAN
