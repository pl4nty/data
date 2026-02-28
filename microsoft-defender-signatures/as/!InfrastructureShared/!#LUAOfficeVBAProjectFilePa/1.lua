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
    if 12 < L2_1 and L1_1 ~= nil then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "/vbaproject.bin"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = ""
        L4_1 = L0_1
        L3_1 = L0_1.find
        L5_1 = "\\downloads"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L0_1
        L3_1 = L0_1.find
        L5_1 = "\\users\\[^\\]+\\downloads"
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 == nil then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L0_1
        L3_1 = L0_1.sub
        L5_1 = -10
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 == "\\downloads" then
          L2_1 = "Lua:VbaProjectWrittenToDownloadFolder"
        else
          L4_1 = L0_1
          L3_1 = L0_1.find
          L5_1 = "\\downloads\\[^\\]+$"
          L3_1 = L3_1(L4_1, L5_1)
          if L3_1 ~= nil then
            L2_1 = "Lua:VbaProjectWrittenToDownloadFolder1Sub"
          else
            L3_1 = mp
            L3_1 = L3_1.CLEAN
            return L3_1
          end
        end
        L3_1 = mp
        L3_1 = L3_1.get_contextdata
        L4_1 = mp
        L4_1 = L4_1.CONTEXT_DATA_NEWLYCREATEDHINT
        L3_1 = L3_1(L4_1)
        if L3_1 == true then
          L3_1 = mp
          L3_1 = L3_1.set_mpattribute
          L4_1 = L2_1
          L3_1(L4_1)
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
        L3_1 = {}
        L3_1["excel.exe"] = true
        L3_1["winword.exe"] = true
        L4_1 = mp
        L4_1 = L4_1.get_contextdata
        L5_1 = mp
        L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
        L4_1 = L4_1(L5_1)
        if L4_1 == nil then
          L5_1 = ""
          if L5_1 then
            goto lbl_102
          end
        end
        L5_1 = L4_1
        ::lbl_102::
        L6_1 = L5_1
        L5_1 = L5_1.lower
        L5_1 = L5_1(L6_1)
        L4_1 = L5_1
        L5_1 = L3_1[L4_1]
        if L5_1 ~= true then
          L5_1 = L2_1
          L6_1 = "NotbyOffice"
          L2_1 = L5_1 .. L6_1
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = L2_1
          L5_1(L6_1)
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
