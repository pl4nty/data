-- Threat: !InfrastructureShared
-- Name: 227f0e81c715
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 512)
if string.find(l_0_0, "taskmgr.exe, msconfig.exe, regedit.exe, cmd.exe") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
