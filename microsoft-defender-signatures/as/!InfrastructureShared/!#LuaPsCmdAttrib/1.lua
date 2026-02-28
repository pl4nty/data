local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 ~= nil then
  L3_1 = L0_1
  L2_1 = L0_1.len
  L2_1 = L2_1(L3_1)
  if 10 < L2_1 and L1_1 ~= nil then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "->"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "->[embeddedenc]->"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "LuaPSEncoded"
      L2_1(L3_1)
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "->(base64)->"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "LuaPSB64"
      L2_1(L3_1)
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "->(utf-"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "LuaPSUnicode"
      L2_1(L3_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
