local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "PUA:"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "RPF:PUA:PREDICT:"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "RPF:PEEXEHasIOAVURL"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = false
L1_1 = false
L2_1 = false
L3_1 = false
L4_1 = false
L5_1 = mp
L5_1 = L5_1.get_mpattributesubstring
L6_1 = "RPF:PEEXEHasIOAVURL"
L5_1 = L5_1(L6_1)
if L5_1 then
  L1_1 = true
else
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L6_1 = mp
  L6_1 = L6_1.bitor
  L7_1 = mp
  L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
  L8_1 = mp
  L8_1 = L8_1.FILEPATH_QUERY_PATH
  L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L5_1
  L8_1 = 1
  L9_1 = 8
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 == "\\device\\" then
    L6_1 = MpCommon
    L6_1 = L6_1.PathToWin32Path
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
  end
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L5_1
  L8_1 = -14
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == ":\\windows\\temp" then
    L6_1 = mp
    L6_1 = L6_1.getfilename
    L7_1 = mp
    L7_1 = L7_1.bitor
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_LOWERCASE
    L9_1 = mp
    L9_1 = L9_1.FILEPATH_QUERY_FNAME
    L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L6_1
    L9_1 = "^tmp%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x$"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = ":\\users\\[^\\]+\\downloads\\"
  L9_1 = 1
  L10_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = L5_1
    L8_1 = -10
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= "\\downloads" then
      goto lbl_113
    end
  end
  L1_1 = true
  goto lbl_179
  ::lbl_113::
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "\\temp\\"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = L5_1
    L8_1 = -5
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= "\\temp" then
      goto lbl_131
    end
  end
  L2_1 = true
  goto lbl_179
  ::lbl_131::
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = ":\\users\\[^\\]+\\desktop"
  L9_1 = 1
  L10_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L3_1 = true
  else
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = ":\\program files"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = ":\\programdata"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = ":\\windows"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L5_1
          L8_1 = ":\\users\\[^\\]+\\appdata"
          L9_1 = 1
          L10_1 = false
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            goto lbl_179
          end
        end
      end
    end
    L4_1 = true
  end
end
::lbl_179::
if L0_1 or L1_1 or L2_1 or L3_1 or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "CONTEXT:PUA:InstallContextMet"
  L5_1(L6_1)
  if L0_1 or L1_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "CONTEXT:PUA:InstallContextMet:Download"
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
