local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 24 or 255 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.bitand
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 8
L2_1 = L2_1(L3_1, L4_1)
L3_1 = 16777215
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 6070466 then
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = headerpage
  L4_1 = 1
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = 16777215
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 6070466 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "\160\\-({?[%w%s%p]+}?)(%.{?[%w%s%-]+}?)\"?,[%w%p%s]+%z"
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L4_1 = L8_1
L3_1 = L7_1
_ = L6_1
L2_1 = L5_1
if L2_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = {}
  L6_1[".exe"] = true
  L6_1[".dll"] = true
  L6_1[".cpl"] = true
  L6_1[".ocx"] = true
  L7_1 = L6_1[L5_1]
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = nil
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_SCANREASON
  L8_1 = L8_1(L9_1)
  L9_1 = mp
  L9_1 = L9_1.SCANREASON_ONOPEN
  if L8_1 ~= L9_1 then
    L9_1 = mp
    L9_1 = L9_1.SCANREASON_ONMODIFIEDHANDLECLOSE
    if L8_1 ~= L9_1 then
      goto lbl_95
    end
  end
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = mp
  L10_1 = L10_1.get_contextdata
  L11_1 = mp
  L11_1 = L11_1.CONTEXT_DATA_FILEPATH
  L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1)
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  L7_1 = L9_1
  ::lbl_95::
  if L7_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.getfilename
    L9_1 = L9_1()
    L10_1 = L9_1
    L9_1 = L9_1.match
    L11_1 = "(.+)\\[^\\]+$"
    L9_1 = L9_1(L10_1, L11_1)
    L7_1 = L9_1
  end
  if L7_1 ~= nil then
    L9_1 = mp
    L9_1 = L9_1.ReportLowfi
    L10_1 = L7_1
    L11_1 = "\\\194\160\\"
    L12_1 = L3_1
    L13_1 = L4_1
    L10_1 = L10_1 .. L11_1 .. L12_1 .. L13_1
    L11_1 = 2406282551
    L9_1(L10_1, L11_1)
    L9_1 = mp
    L9_1 = L9_1.ReportLowfi
    L10_1 = L7_1
    L11_1 = "\\\194\160\\IndexerVolumeGuid"
    L10_1 = L10_1 .. L11_1
    L11_1 = 2012828607
    L9_1(L10_1, L11_1)
  end
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
