local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "windows\\syswow64\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "windows\\system32\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "\\empower\\oracle\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 and L3_1 ~= "uninstall.dll" and L3_1 ~= "glprop.ax" then
      goto lbl_84
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_84::
L4_1 = nil
if L0_1 ~= "rundll32.exe" and L0_1 ~= "regsvr32.exe" then
  L5_1 = L1_1
  L6_1 = "\\"
  L7_1 = L0_1
  L5_1 = L5_1 .. L6_1 .. L7_1
  L6_1 = MpCommon
  L6_1 = L6_1.GetOriginalFileName
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L4_1 = L6_1
end
if L0_1 == "regsvr32.exe" or L4_1 ~= nil and L4_1 == "regsvr32.exe" then
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
  L5_1 = L5_1(L6_1)
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContext
  L7_1 = L5_1
  L8_1 = "MountedDriveExeCreatesDll"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/MountedDriveCreatedDllRegsvrLoad"
    L6_1(L7_1)
  end
elseif L0_1 == "rundll32.exe" or L4_1 ~= nil and L4_1 == "rundll32.exe" then
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
  L5_1 = L5_1(L6_1)
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContext
  L7_1 = L5_1
  L8_1 = "MountedDriveExeCreatesDll"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/MountedDriveCreatedDllRundllLoad"
    L6_1(L7_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
