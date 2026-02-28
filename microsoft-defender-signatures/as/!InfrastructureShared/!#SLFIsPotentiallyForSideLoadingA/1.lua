local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L2_1 = {}
L2_1["mpclient.dll"] = true
L2_1["mptrace.dll"] = true
L3_1 = L2_1[L1_1]
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.getfilesize
  L3_1 = L3_1()
  if L3_1 < 256 or 2097152 < L3_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetCertificateInfo
  L4_1 = L4_1()
  L5_1 = pairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.Signers
    if L10_1 ~= nil then
      L10_1 = mp
      L10_1 = L10_1.IsTrustedFile
      L11_1 = true
      L12_1 = false
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "programdata\\microsoft"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "program files"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = ":\\windows\\system32"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = ":\\windows\\syswow64"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = ":\\windows\\winsxs"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = ":\\windows\\servicing"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = ":\\$extend\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = L0_1
  L6_1 = "\\"
  L7_1 = L1_1
  L5_1 = L5_1 .. L6_1 .. L7_1
  L6_1 = AppendToRollingQueue
  L7_1 = "DllSideloadMonitor"
  L8_1 = L5_1
  L9_1 = nil
  L10_1 = 5000
  L6_1(L7_1, L8_1, L9_1, L10_1)
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:PossiblyForSideloading!"
  L8_1 = L1_1
  L7_1 = L7_1 .. L8_1
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
