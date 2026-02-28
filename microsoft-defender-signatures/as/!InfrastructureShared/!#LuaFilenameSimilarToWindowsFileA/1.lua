local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 5) then
    L2_1 = #L1_1
    if not (48 < L2_1) then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = -4
      L5_1 = -4
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 == "." and L0_1 ~= nil then
        L2_1 = #L0_1
        if not (L2_1 < 3) then
          L2_1 = string
          L2_1 = L2_1.sub
          L3_1 = L0_1
          L4_1 = -17
          L2_1 = L2_1(L3_1, L4_1)
          if L2_1 ~= "\\windows\\system32" then
            L2_1 = string
            L2_1 = L2_1.sub
            L3_1 = L0_1
            L4_1 = -17
            L2_1 = L2_1(L3_1, L4_1)
            if L2_1 ~= "\\windows\\syswow64" then
              goto lbl_54
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_54::
L2_1 = normalize_path
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = #L2_1
if 65 < L3_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 17
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == ":\\windows\\winsxs" then
    goto lbl_116
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 20
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == ":\\windows\\servicing" then
    goto lbl_116
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 31
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == ":\\windows\\softwaredistribution" then
    goto lbl_116
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 15
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == ":\\windows\\csc\\" then
    goto lbl_116
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 20
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == ":\\windows\\assembly\\" then
    goto lbl_116
  end
end
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 0
L6_1 = 2
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= "\\\\" then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 2
  L6_1 = 16
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 ~= ":\\program files" then
    goto lbl_119
  end
end
::lbl_116::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_119::
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L1_1
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= "exe" and L3_1 ~= "dll" and L3_1 ~= "ocx" and L3_1 ~= "cpl" and L3_1 ~= "com" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L2_1
L5_1 = "\\"
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = mp
L5_1 = L5_1.IsKnownFriendlyFile
L6_1 = L4_1
L7_1 = false
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "BM_HAS_DIGITALSIGNATURE"
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.IsTrustedFile
  L6_1 = false
  L5_1 = L5_1(L6_1)
  if L5_1 == true then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%windir%"
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = #L5_1
  if not (L6_1 < 4) then
    goto lbl_179
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_179::
L6_1 = L5_1
L7_1 = "\\system32\\"
L8_1 = L1_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = sysio
L7_1 = L7_1.IsFileExists
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = "Lua:FilenameExistInSystemFolder.A"
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = L7_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = L7_1
  L10_1 = "!"
  L11_1 = L3_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = L7_1
  L10_1 = "!"
  L11_1 = L1_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L7_1 = L5_1
L8_1 = "\\syswow64\\"
L9_1 = L1_1
L7_1 = L7_1 .. L8_1 .. L9_1
L8_1 = sysio
L8_1 = L8_1.IsFileExists
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = "Lua:FilenameExistInSyswowFolder.A"
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = L8_1
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = L8_1
  L11_1 = "!"
  L12_1 = L3_1
  L10_1 = L10_1 .. L11_1 .. L12_1
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = L8_1
  L11_1 = "!"
  L12_1 = L1_1
  L10_1 = L10_1 .. L11_1 .. L12_1
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
