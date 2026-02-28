local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 10240000 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 < 102400 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "LUA:O97M/MacroFiles_FileSizeBorder"
  L1_1(L2_1)
else
  L1_1 = 0
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "MHSTR:MacroJustEnviron"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "MHSTR:MacroGetEnvironmentVariable"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      goto lbl_30
    end
  end
  L1_1 = L1_1 + 1
  ::lbl_30::
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "MHSTR:MacroExecute"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L1_1 = L1_1 + 1
  end
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "MHSTR:MacroDownload"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "MHSTR:MacroHTTPRequest"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      goto lbl_50
    end
  end
  L1_1 = L1_1 + 1
  ::lbl_50::
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "MHSTR:MacroConcatVariations"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "MHSTR:MacroJustConcatVariations"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "MHSTR:MacroJustConcatChrVariations"
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        goto lbl_69
      end
    end
  end
  L1_1 = L1_1 + 1
  ::lbl_69::
  if L0_1 < 1024000 and 2 <= L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "LUA:O97M/MacroFilesAttributeCheck.A"
    L2_1(L3_1)
  elseif 3 <= L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "LUA:O97M/MacroFilesAttributeCheck.B"
    L2_1(L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
