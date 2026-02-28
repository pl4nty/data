local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.FileDescription
  if L2_1 ~= nil then
    L2_1 = L1_1.OriginalFilename
    if L2_1 ~= nil then
      goto lbl_23
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = L1_1.OriginalFilename
if L2_1 ~= "usermgrproxy.dll" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.FileDescription
if L2_1 ~= "UserMgrProxy" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
if L2_1 < 8 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = pe
L4_1 = L4_1.mmap_string_rva
L5_1 = L2_1 - 2
L5_1 = L3_1[L5_1]
L5_1 = L5_1.namerva
L6_1 = 64
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= "AccountsMgmtVerifyExchangeMailBoxTokenAuth" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = pe
L5_1 = L5_1.mmap_string_rva
L6_1 = L2_1 - 3
L6_1 = L3_1[L6_1]
L6_1 = L6_1.namerva
L7_1 = 64
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
if L4_1 ~= "AccountsMgmtUnadviseAccount" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = pe
L5_1 = L5_1.mmap_string_rva
L6_1 = L2_1 - 4
L6_1 = L3_1[L6_1]
L6_1 = L6_1.namerva
L7_1 = 64
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
if L4_1 ~= "AccountsMgmtSyncAccountAndWaitForCompletion" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
