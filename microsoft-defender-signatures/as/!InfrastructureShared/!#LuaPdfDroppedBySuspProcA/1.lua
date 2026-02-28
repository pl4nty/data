local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = "global_marker"
L1_1 = "big_lnk_file_with_ps"
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContextNoPath
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_SCANREASON
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L3_1 ~= L4_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_NEWLYCREATEDHINT
L3_1 = L3_1(L4_1)
if L3_1 ~= true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "Lua:PdfDroppedBySuspProc"
L5_1 = MpCommon
L5_1 = L5_1.QueryPersistContext
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L2_1 = L5_1
if L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESSNAME
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = {}
L6_1["powershell.exe"] = true
L6_1["cscript.exe"] = true
L6_1["wscript.exe"] = true
L7_1 = L6_1[L5_1]
if L7_1 ~= true then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.set_mpattribute
L8_1 = "MpDisableCaching"
L7_1(L8_1)
L7_1 = string
L7_1 = L7_1.find
L8_1 = L3_1
L9_1 = "\\device\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = MpCommon
  L7_1 = L7_1.PathToWin32Path
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  L3_1 = L7_1
end
if L3_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.AppendPersistContext
L8_1 = L3_1
L9_1 = L4_1
L10_1 = 30
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
