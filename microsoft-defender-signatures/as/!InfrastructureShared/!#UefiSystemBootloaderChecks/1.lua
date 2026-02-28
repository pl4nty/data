local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = sysio
L0_1 = L0_1.QuerySymbolicLinkObject
L1_1 = "\\??\\globalroot\\device\\SystemPartition"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\device\\"
L4_1 = 1
L5_1 = true
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  L0_1 = L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = L0_1
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_mpattribute
L5_1 = "PEPCODE:HasDigitalSignature"
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.IsTrustedFile
  L5_1 = false
  L4_1 = L4_1(L5_1)
  if false == L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:BootloaderInvalidSig"
    L4_1(L5_1)
  else
    L4_1 = mp
    L4_1 = L4_1.IsTrustedFile
    L5_1 = true
    L4_1 = L4_1(L5_1)
    if false == L4_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:BootloaderUntrustedPub"
      L4_1(L5_1)
    end
  end
else
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:BootloaderUnsigned"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
