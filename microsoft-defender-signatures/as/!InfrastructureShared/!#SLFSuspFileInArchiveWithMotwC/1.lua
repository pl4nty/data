local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWZone
  L0_1 = L0_1()
  if L0_1 == nil or L0_1 < 3 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if 2097152 < L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1()
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.len
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not (L3_1 < 10) then
      goto lbl_43
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_43::
  L4_1 = L2_1
  L3_1 = L2_1.sub
  L5_1 = -4
  L3_1 = L3_1(L4_1, L5_1)
  L5_1 = L2_1
  L4_1 = L2_1.sub
  L6_1 = -6
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = {}
  L5_1[".jse"] = true
  L5_1[".vbs"] = true
  L5_1[".wsf"] = true
  L5_1[".vbe"] = true
  L5_1[".hta"] = true
  L5_1[".mht"] = true
  L5_1[".bat"] = true
  L5_1[".ps1"] = true
  L5_1[".cmd"] = true
  L5_1[".url"] = true
  L5_1[".exe"] = true
  L5_1[".scr"] = true
  L5_1[".pif"] = true
  L5_1[".lnk"] = true
  L5_1[".docx"] = true
  L5_1[".xlsx"] = true
  L5_1[".doc"] = true
  L5_1[".xls"] = true
  L5_1[".rtf"] = true
  L5_1.docm = true
  L5_1.xlsm = true
  L5_1.ppam = true
  L5_1.pptm = true
  L5_1.ppsm = true
  L5_1.potm = true
  L6_1 = L5_1[L3_1]
  if L6_1 ~= true then
    L6_1 = L5_1[L4_1]
    if L6_1 ~= true then
      goto lbl_108
    end
  end
  L7_1 = L2_1
  L6_1 = L2_1.find
  L8_1 = ".zip->"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L7_1 = L2_1
    L6_1 = L2_1.find
    L8_1 = ".7z->"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L7_1 = L2_1
      L6_1 = L2_1.find
      L8_1 = ".rar->"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_108::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
