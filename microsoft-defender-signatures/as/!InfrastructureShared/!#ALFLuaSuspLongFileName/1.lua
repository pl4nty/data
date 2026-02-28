local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
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
  L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
  L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
  if L0_1 ~= nil then
    L3_1 = L0_1
    L2_1 = L0_1.len
    L2_1 = L2_1(L3_1)
    if 10 < L2_1 and L1_1 ~= nil then
      L3_1 = L1_1
      L2_1 = L1_1.len
      L2_1 = L2_1(L3_1)
      if 31 < L2_1 then
        L2_1 = string
        L2_1 = L2_1.sub
        L3_1 = L1_1
        L4_1 = -5
        L2_1 = L2_1(L3_1, L4_1)
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "."
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.match
        L5_1 = "^[0-9a-f]+"
        L3_1 = L3_1(L4_1, L5_1)
        L5_1 = L3_1
        L4_1 = L3_1.len
        L4_1 = L4_1(L5_1)
        if L3_1 ~= nil and not (L4_1 < 31) then
          L6_1 = L1_1
          L5_1 = L1_1.len
          L5_1 = L5_1(L6_1)
          L5_1 = L5_1 - 5
          if not (L4_1 < L5_1) then
            goto lbl_69
          end
        end
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        do return L5_1 end
        ::lbl_69::
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
