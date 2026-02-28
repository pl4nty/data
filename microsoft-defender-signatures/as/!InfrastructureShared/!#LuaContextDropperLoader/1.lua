local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
L1_1 = L1_1(L2_1)
if L1_1 == nil or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 == "" or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = "\\"
L4_1 = L0_1
L2_1 = L2_1 .. L3_1 .. L4_1
L3_1 = MpCommon
L3_1 = L3_1.GetOriginalFileName
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 ~= "regsvr32.exe" and L3_1 ~= "rundll32.exe" and L0_1 ~= "regsvr32.exe" and L0_1 ~= "rundll32.exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L4_1 = L4_1(L5_1)
L5_1 = MpCommon
L5_1 = L5_1.QueryPersistContext
L6_1 = L4_1
L7_1 = "DllDroppedByExcel"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = MpCommon
  L5_1 = L5_1.QueryPersistContext
  L6_1 = L4_1
  L7_1 = "CabDroppedByExcel"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    goto lbl_101
  end
end
if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/ExcelDropRegsvrLoad"
  L5_1(L6_1)
elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/ExcelDropRundllLoad"
  L5_1(L6_1)
end
::lbl_101::
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L5_1 = L5_1(L6_1)
L6_1 = MpCommon
L6_1 = L6_1.QueryPersistContext
L7_1 = L5_1
L8_1 = "DllDroppedByWord"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/WordDropRegsvrLoad"
    L6_1(L7_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/WordDropRundllLoad"
    L6_1(L7_1)
  end
end
L6_1 = mp
L6_1 = L6_1.getfilename
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
L6_1 = L6_1(L7_1)
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "DllDroppedByNotepadpp"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/NotepadppDropRegsvrLoad"
    L7_1(L8_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/NotepadppDropRundllLoad"
    L7_1(L8_1)
  end
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "DllDroppedByPowerShell"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/PowershellDropRegsvrLoad"
    L7_1(L8_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/PowershellDropRundllLoad"
    L7_1(L8_1)
  end
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "DllDroppedByWscript"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/WscriptDropRegsvrLoad"
    L7_1(L8_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/WscriptDropRundllLoad"
    L7_1(L8_1)
  end
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "DllDroppedByCscript"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/CscriptDropRegsvrLoad"
    L7_1(L8_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/CscriptDropRundllLoad"
    L7_1(L8_1)
  end
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "DllDroppedByCurl"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  if L0_1 == "regsvr32.exe" or L3_1 ~= nil and L3_1 == "regsvr32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/CurlDropRegsvrLoad"
    L7_1(L8_1)
  elseif L0_1 == "rundll32.exe" or L3_1 ~= nil and L3_1 == "rundll32.exe" then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:Context/CurlDropRundllLoad"
    L7_1(L8_1)
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
