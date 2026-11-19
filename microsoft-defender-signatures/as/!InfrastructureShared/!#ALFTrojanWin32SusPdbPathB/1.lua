-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/SusPdbPath.B
-- Type: 13
-- MpAttributes: Lua:PDBExt & RPF:TopLevelFile

local l_0_0 = mp.getfilename()
if l_0_0 == "C:\\Users\\dev_win10_00\\Documents\\Sardonic\\SardonicUtility\\LoaderAssembly\\obj\\x86\\Release\\MSDAC.pdb" or l_0_0 == "C:\\Users\\dev_win10_00\\Documents\\f5\\F5Utility\\LoaderAssembly\\obj\\x86\\Release\\Default.pdb" then
  return mp.INFECTED
end
return mp.CLEAN
