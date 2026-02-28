local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LastFolder1!users"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:LastFolderCount!2"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FNAME
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
    if L0_1 ~= nil then
      L1_1 = #L0_1
      if not (8 <= L1_1) then
        goto lbl_31
      end
    end
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    do return L1_1 end
    ::lbl_31::
    L1_1 = mp
    L1_1 = L1_1.get_contextdata
    L2_1 = mp
    L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
    L1_1 = L1_1(L2_1)
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = split
    L3_1 = L1_1
    L4_1 = "\\"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = #L2_1
    if 7 <= L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
