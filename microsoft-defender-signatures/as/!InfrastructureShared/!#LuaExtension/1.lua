local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 ~= nil then
  L2_1 = #L0_1
  if 10 < L2_1 and L1_1 ~= nil then
    L2_1 = #L1_1
    if 4 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = -3
      L2_1 = L2_1(L3_1, L4_1)
      L3_1 = {}
      L3_1.ocx = true
      L3_1.cpl = true
      L3_1.tmp = true
      L4_1 = L3_1[L2_1]
      if L4_1 == true then
        L4_1 = "LUA:Ext_"
        L5_1 = L2_1
        L4_1 = L4_1 .. L5_1
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = L4_1
        L5_1(L6_1)
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
