-- Threat: !InfrastructureShared
-- Name: !#ALF:Ransom:Win32/Revil.F
-- Type: 13
-- MpAttributes: Lua:PDBExt & RPF:TopLevelFile

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "rwenc_exe_x86_debug", 1, true) or string.find(l_0_0, "rwenc_exe_x64_debug", 1, true) or string.find(l_0_0, "rwenc_dll_x86_debug", 1, true) or string.find(l_0_0, "rwenc_dll_x64_debug", 1, true) or string.find(l_0_0, "rwenc_x86_x86_debug", 1, true) or string.find(l_0_0, "rwenc_x86_x64_debug", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
