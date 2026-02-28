local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "MpInternal_researchdata=newlyCreated="
  L2_1 = "true"
  L1_1 = L1_1 .. L2_1
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
L1_1 = L1_1(L2_1)
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil or L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L2_1 == "" or L0_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1
L4_1 = "\\"
L5_1 = L0_1
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "MpInternal_researchdata=parentProcessPath="
L6_1 = L3_1
L5_1 = L5_1 .. L6_1
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.GetOriginalFileName
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = ""
if L4_1 == nil or L4_1 == "" then
  L6_1 = sysio
  L6_1 = L6_1.GetPEVersionInfo
  L7_1 = L3_1
  L6_1 = L6_1(L7_1)
  if L6_1 ~= nil then
    L7_1 = next
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 ~= nil then
      goto lbl_94
    end
  end
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpInternal_researchdata=ERRORS="
  L9_1 = "Failed to extract file verinfo"
  L8_1 = L8_1 .. L9_1
  L7_1(L8_1)
  L7_1 = MpCommon
  L7_1 = L7_1.StringRegExpSearch
  L8_1 = "(proc|handle|tcpview|winobj|logonsessions|tcpvcon|ir_lsess)"
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L0_1
  L9_1, L10_1 = L9_1(L10_1)
  L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 == true then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  do return L9_1 end
  ::lbl_94::
  L4_1 = L6_1.OriginalFilename
  L5_1 = L6_1.InternalName
end
if L4_1 ~= nil and L4_1 ~= "" then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  L4_1 = L6_1
  L6_1 = MpCommon
  L6_1 = L6_1.StringRegExpSearch
  L7_1 = "(procexp|handle|tcpview|winobj|logonsessions|tcpvcon)"
  L8_1 = L4_1
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  if L6_1 == true then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "MpInternal_researchdata=parentProcessOFN="
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
elseif L5_1 ~= nil and L5_1 ~= "" then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = MpCommon
  L6_1 = L6_1.StringRegExpSearch
  L7_1 = "(process explorer|handle|tcpview|winobj|logonsessions|tcpvcon)"
  L8_1 = L5_1
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  if L6_1 == true then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "MpInternal_researchdata=parentProcessInternalName="
  L10_1 = L5_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
