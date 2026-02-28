local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
L1_1 = L0_1.Arguments
L2_1 = L0_1.BasePath
L3_1 = {}
L4_1 = "odbcconf"
L5_1 = "rundll32"
L6_1 = "regsvr"
L7_1 = "powershell"
L8_1 = "calc"
L9_1 = "wscript"
L10_1 = "cscript"
L11_1 = "mshta"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
if L1_1 ~= nil then
  L4_1 = contains
  L6_1 = L1_1
  L5_1 = L1_1.lower
  L5_1 = L5_1(L6_1)
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    goto lbl_34
  end
end
if L2_1 ~= nil then
  L4_1 = contains
  L6_1 = L2_1
  L5_1 = L2_1.lower
  L5_1 = L5_1(L6_1)
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  ::lbl_34::
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L5_1 = mp
    L5_1 = L5_1.bitor
    L6_1 = mp
    L6_1 = L6_1.bitor
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_FNAME
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_PATH
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1, L7_1)
    L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    if L4_1 ~= nil then
      L6_1 = #L4_1
      if not (2 < L6_1) and L5_1 ~= nil then
        goto lbl_59
      end
    end
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    do return L6_1 end
    ::lbl_59::
    L6_1 = L4_1
    L7_1 = "\\"
    L8_1 = L5_1
    L6_1 = L6_1 .. L7_1 .. L8_1
    L7_1 = MpCommon
    L7_1 = L7_1.GetMountedFileBackingFilePath
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 == nil then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = IsKeyInRollingQueue
    L9_1 = "CC_filelist"
    L10_1 = L7_1
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = L7_1
      L10_1 = 818474255
      L8_1(L9_1, L10_1)
    end
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
