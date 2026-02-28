local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\software\\microsoft\\asrfix"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 1
L4_1 = 4
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.GetRegValueAsDword
  L4_1 = L2_1
  L5_1 = "scriptresult"
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = sysio
  L4_1 = L4_1.GetRegValueAsDword
  L5_1 = L2_1
  L6_1 = "hklmfailure"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsDword
  L6_1 = L2_1
  L7_1 = "hklmsuccess"
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = sysio
  L6_1 = L6_1.GetRegValueAsDword
  L7_1 = L2_1
  L8_1 = "hkuappfailure"
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = sysio
  L7_1 = L7_1.GetRegValueAsDword
  L8_1 = L2_1
  L9_1 = "hkuappsuccess"
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = sysio
  L8_1 = L8_1.GetRegValueAsDword
  L9_1 = L2_1
  L10_1 = "numlinksfound"
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = sysio
  L9_1 = L9_1.GetRegValueAsString
  L10_1 = L2_1
  L11_1 = "scripterror"
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = sysio
  L10_1 = L10_1.GetRegValueAsString
  L11_1 = L2_1
  L12_1 = "timestamp"
  L10_1 = L10_1(L11_1, L12_1)
  L11_1 = sysio
  L11_1 = L11_1.GetRegValueAsDword
  L12_1 = L2_1
  L13_1 = "version"
  L11_1 = L11_1(L12_1, L13_1)
  if L3_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=scriptresult=%d"
    L15_1 = L3_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L4_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=hklmfailure=%d"
    L15_1 = L4_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L5_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=hklmsuccess=%d"
    L15_1 = L5_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L6_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=hkuappfailure=%d"
    L15_1 = L6_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L7_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=hkuappsuccess=%d"
    L15_1 = L7_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L8_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=numlinksfound=%d"
    L15_1 = L8_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L9_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=scripterror=%s"
    L15_1 = L9_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L10_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=timestamp=%s"
    L15_1 = L10_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L11_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "MpInternal_researchdata=version=%d"
    L15_1 = L11_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  end
  if L1_1 == "hkcu" then
    L12_1 = sysio
    L12_1 = L12_1.GetRegValueAsDword
    L13_1 = L2_1
    L14_1 = "mprecovertoolexecstatus"
    L12_1 = L12_1(L13_1, L14_1)
    L13_1 = sysio
    L13_1 = L13_1.GetRegValueAsDword
    L14_1 = L2_1
    L15_1 = "mprecoversuccesscount"
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = sysio
    L14_1 = L14_1.GetRegValueAsString
    L15_1 = L2_1
    L16_1 = "mptaskbarrecoverversion"
    L14_1 = L14_1(L15_1, L16_1)
    if L12_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = string
      L16_1 = L16_1.format
      L17_1 = "MpInternal_researchdata=mprecovertoolexecstatus=%d"
      L18_1 = L12_1
      L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
      L15_1(L16_1, L17_1, L18_1)
    end
    if L12_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = string
      L16_1 = L16_1.format
      L17_1 = "MpInternal_researchdata=mprecoversuccesscount=%d"
      L18_1 = L13_1
      L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
      L15_1(L16_1, L17_1, L18_1)
    end
    if L12_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = string
      L16_1 = L16_1.format
      L17_1 = "MpInternal_researchdata=mptaskbarrecoverversion=%s"
      L18_1 = L14_1
      L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
      L15_1(L16_1, L17_1, L18_1)
    end
  end
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
