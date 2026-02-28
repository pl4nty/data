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
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = peattributes
    L0_1 = L0_1.isexe
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.isdriver
      if not L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.no_security
        if L0_1 ~= false then
          L0_1 = peattributes
          L0_1 = L0_1.no_fixups
          if L0_1 ~= false then
            goto lbl_36
          end
        end
      end
    end
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    do return L0_1 end
    ::lbl_36::
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    if L0_1 < 262144 or 1048576 < L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_FNAME
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\temp\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = {}
    L3_1["exename.exe"] = true
    L4_1 = L3_1[L2_1]
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "^rad%x%x%x%x%x%.tmp%.exe$"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
