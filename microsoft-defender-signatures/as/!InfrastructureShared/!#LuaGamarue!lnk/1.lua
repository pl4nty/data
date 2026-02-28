local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 24 or 255 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 33
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 1554039296 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = headerpage
  L3_1 = 33
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 2697077248 then
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
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = nil
L4_1 = nil
L5_1 = nil
L7_1 = L2_1
L6_1 = L2_1.find
L8_1 = "^%l:\\windows\\system32\\rundll32%.exe%z"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  while "_" do
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\(%l+)(%.%l%l%l),%l+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
    if L3_1 then
      break
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\(~%$%l+)(%.%l%l%l),%l+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
    if L3_1 then
      break
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\(%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+)(%.%w+),%w+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
    if L3_1 then
      break
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\(%w+)(%.%w+),%w+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
    if L3_1 then
      break
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\({?[%w%s%p]+}?)(%.{?[%w%s%-]+}?)\"?,[%w%p%s]+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
    if L3_1 then
      break
    end
    break
  end
else
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L1_1
  L8_1 = "\194\160\\(%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+)(%.%w+),%w+%z"
  L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
  L5_1 = L9_1
  L4_1 = L8_1
  _ = L7_1
  L3_1 = L6_1
  if not L3_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\160\\\\\\\\\\\\\\\\\\\\\\(%p%p%p%p%p-)(%.%d),%w+%z"
    L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    L3_1 = L6_1
  end
end
if L3_1 then
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
  L7_1 = mp
  L7_1 = L7_1.get_parent_filehandle
  L7_1 = L7_1()
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.readfile_by_handle
  L9_1 = L7_1
  L10_1 = 0
  L11_1 = 64
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  if L8_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.readu_u32
  L10_1 = L8_1
  L11_1 = 1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= 76 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.readu_u32
  L10_1 = L8_1
  L11_1 = 57
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= 7 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = nil
  L10_1 = mp
  L10_1 = L10_1.get_contextdata
  L11_1 = mp
  L11_1 = L11_1.CONTEXT_DATA_SCANREASON
  L10_1 = L10_1(L11_1)
  L11_1 = mp
  L11_1 = L11_1.SCANREASON_ONOPEN
  if L10_1 ~= L11_1 then
    L11_1 = mp
    L11_1 = L11_1.SCANREASON_ONMODIFIEDHANDLECLOSE
    if L10_1 ~= L11_1 then
      goto lbl_216
    end
  end
  L11_1 = MpCommon
  L11_1 = L11_1.PathToWin32Path
  L12_1 = mp
  L12_1 = L12_1.get_contextdata
  L13_1 = mp
  L13_1 = L13_1.CONTEXT_DATA_FILEPATH
  L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1)
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  L9_1 = L11_1
  ::lbl_216::
  if L9_1 == nil then
    L11_1 = mp
    L11_1 = L11_1.getfilename
    L11_1 = L11_1()
    L12_1 = L11_1
    L11_1 = L11_1.match
    L13_1 = "(.+)\\[^\\]+$"
    L11_1 = L11_1(L12_1, L13_1)
    L9_1 = L11_1
  end
  if L9_1 ~= nil then
    L11_1 = mp
    L11_1 = L11_1.ReportLowfi
    L12_1 = L9_1
    L13_1 = "\\\194\160\\"
    L14_1 = L4_1
    L15_1 = L5_1
    L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1
    L13_1 = 2406282551
    L11_1(L12_1, L13_1)
    L11_1 = mp
    L11_1 = L11_1.ReportLowfi
    L12_1 = L9_1
    L13_1 = "\\\194\160\\IndexerVolumeGuid"
    L12_1 = L12_1 .. L13_1
    L13_1 = 2012828607
    L11_1(L12_1, L13_1)
  end
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
