local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L2_1 == "rbkvssprovider.dll" then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "\\temp\\rubrik_vmware"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "program files\\rubrik\\rubrik backup service\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_47
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_47::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "windows\\syswow64"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 and (L2_1 == "ven2232.olb" or L2_1 == "vbako32.olb" or L2_1 == "vbaend32.olb" or L2_1 == "vbade32.olb" or L2_1 == "vbachs32.olb" or L2_1 == "mscomctl.ocx") then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L0_1 == "excel.exe" then
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
  L3_1 = L3_1(L4_1)
  L4_1 = "DllDroppedByExcel"
  L5_1 = MpCommon
  L5_1 = L5_1.QueryPersistContext
  L6_1 = L3_1
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L6_1 = MpCommon
    L6_1 = L6_1.AppendPersistContext
    L7_1 = L3_1
    L8_1 = L4_1
    L9_1 = 100
    L6_1(L7_1, L8_1, L9_1)
  end
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "MpDisableCaching"
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
