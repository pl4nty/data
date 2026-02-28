local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
    L0_1 = L0_1(L1_1)
    if L0_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:NewFileContextDataPresent"
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:NewFileContextData:ProcName!"
    L3_1 = L0_1
    L2_1 = L2_1 .. L3_1
    L1_1(L2_1)
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "%.(.+)$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:NewFileContextData:ProcNameExt!"
      L4_1 = L1_1
      L3_1 = L3_1 .. L4_1
      L2_1(L3_1)
    end
    L2_1 = mp
    L2_1 = L2_1.getfilename
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.bitor
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_FNAME
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_PATH
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
    L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L3_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:NewFileContextData:FileName!"
      L6_1 = L3_1
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
    end
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
    L4_1 = L4_1(L5_1)
    if L4_1 ~= nil then
      L5_1 = mp
      L5_1 = L5_1.GetParentProcInfo
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 ~= nil then
        L6_1 = L5_1.image_path
        if L6_1 ~= nil then
          L6_1 = string
          L6_1 = L6_1.match
          L7_1 = L5_1.image_path
          L8_1 = "([^\\]+)$"
          L6_1 = L6_1(L7_1, L8_1)
          if L6_1 then
            L7_1 = string
            L7_1 = L7_1.lower
            L8_1 = L6_1
            L7_1 = L7_1(L8_1)
            L6_1 = L7_1
            L7_1 = mp
            L7_1 = L7_1.set_mpattribute
            L8_1 = "Lua:NewFileContextData:Parent!"
            L9_1 = L6_1
            L8_1 = L8_1 .. L9_1
            L7_1(L8_1)
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
