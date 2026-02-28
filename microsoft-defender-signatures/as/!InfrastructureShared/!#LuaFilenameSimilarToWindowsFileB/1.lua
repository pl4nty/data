local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
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
          goto lbl_40
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_40::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -17
L2_1 = L2_1(L3_1, L4_1)
L3_1 = nil
if L2_1 == "\\windows\\system32" then
  L3_1 = "syswow64"
elseif L2_1 == "\\windows\\syswow64" then
  L3_1 = "system32"
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L1_1
L6_1 = -3
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= "exe" and L4_1 ~= "dll" and L4_1 ~= "ocx" and L4_1 ~= "cpl" and L4_1 ~= "com" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = normalize_path
L6_1 = L0_1
L5_1 = L5_1(L6_1)
L6_1 = L5_1
L7_1 = "\\"
L8_1 = L1_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = mp
L7_1 = L7_1.IsKnownFriendlyFile
L8_1 = L6_1
L9_1 = false
L10_1 = false
L7_1 = L7_1(L8_1, L9_1, L10_1)
if L7_1 == true then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.get_mpattribute
L8_1 = "BM_HAS_DIGITALSIGNATURE"
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.IsTrustedFile
  L8_1 = false
  L7_1 = L7_1(L8_1)
  if L7_1 == true then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L7_1 = MpCommon
L7_1 = L7_1.ExpandEnvironmentVariables
L8_1 = "%windir%"
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L8_1 = #L7_1
  if not (L8_1 < 4) then
    goto lbl_120
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_120::
L8_1 = L7_1
L9_1 = "\\"
L10_1 = L3_1
L11_1 = "\\"
L12_1 = L1_1
L8_1 = L8_1 .. L9_1 .. L10_1 .. L11_1 .. L12_1
L9_1 = sysio
L9_1 = L9_1.IsFileExists
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = "Lua:FilenameExistIn"
  L10_1 = L3_1
  L11_1 = "Folder.B"
  L9_1 = L9_1 .. L10_1 .. L11_1
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = L9_1
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = L9_1
  L12_1 = "!"
  L13_1 = L4_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = L9_1
  L12_1 = "!"
  L13_1 = L1_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
