local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 == "C:\\Users\\dev_win10_00\\Documents\\Sardonic\\SardonicUtility\\LoaderAssembly\\obj\\x86\\Release\\MSDAC.pdb" or L0_1 == "C:\\Users\\dev_win10_00\\Documents\\f5\\F5Utility\\LoaderAssembly\\obj\\x86\\Release\\Default.pdb" then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
