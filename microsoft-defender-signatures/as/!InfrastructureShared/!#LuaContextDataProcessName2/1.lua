local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
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
  L2_1 = "Lua:OpenFileContextDataPresent"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:OpenFileContextData:ProcName!"
  L3_1 = L0_1
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:OpenFileForCreatingProcess"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L2_1 = mp
  L2_1 = L2_1.bitor
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_FNAME
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_PATH
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
  L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  if L2_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:OpenFileContextData:FileName!"
    L5_1 = L2_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
  end
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.GetParentProcInfo
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 ~= nil then
      L5_1 = L4_1.image_path
      if L5_1 ~= nil then
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = string
        L6_1 = L6_1.match
        L7_1 = L4_1.image_path
        L8_1 = "([^\\]+)$"
        L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
        L5_1 = L5_1(L6_1, L7_1, L8_1)
        if L5_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:OpenFileContextData:Parent!"
          L8_1 = L5_1
          L7_1 = L7_1 .. L8_1
          L6_1(L7_1)
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
