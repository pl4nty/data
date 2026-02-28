local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "python"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "py.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "explorer.exe"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpDisableCaching"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = {}
L4_1 = table
L4_1 = L4_1.insert
L5_1 = L3_1
L6_1 = L2_1
L4_1(L5_1, L6_1)
L4_1 = MpCommon
L4_1 = L4_1.SetPersistContextNoPath
L5_1 = "Lua:ExecPatpoopy.A"
L6_1 = L3_1
L7_1 = 0
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
