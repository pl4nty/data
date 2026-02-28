local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TELPER:KPAT:VirTool:Win32/ObfuscatorGd!decblob"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.len
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L1_1, L2_1, L3_1 = L1_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  if L0_1 < 8 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L1_1, L2_1, L3_1 = L1_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "csrss.exe%->%(nsis"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
