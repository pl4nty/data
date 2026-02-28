local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1280 or 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 ~= L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = #L1_1
if not (L3_1 < 4) then
  L3_1 = #L1_1
  if not (512 < L3_1) then
    goto lbl_68
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_68::
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "\\.-\\.-\\.-\\.-\\.-\\.-\\"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "boot"
L5_1 = "program files"
L6_1 = "recycle"
L7_1 = "system volume information"
L8_1 = "temp"
L9_1 = "tmp"
L10_1 = "thumbs"
L11_1 = "tmp"
L12_1 = "windows"
L13_1 = "winnt"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L1_1
  L11_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = ""
  if L5_1 then
    goto lbl_115
  end
end
L5_1 = L4_1
::lbl_115::
L6_1 = L5_1
L5_1 = L5_1.lower
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESSDEVICEPATH
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L5_1 == nil then
  L6_1 = ""
  if L6_1 then
    goto lbl_132
  end
end
L6_1 = L5_1
::lbl_132::
L7_1 = L6_1
L6_1 = L6_1.lower
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = L5_1
L7_1 = "\\"
L8_1 = L4_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "contextualpersistdropnewexepe"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = MpCommon
L8_1 = L8_1.QueryPersistContext
L9_1 = L6_1
L10_1 = L1_1
L8_1 = L8_1(L9_1, L10_1)
if L7_1 and not L8_1 then
  L9_1 = MpCommon
  L9_1 = L9_1.AppendPersistContext
  L10_1 = L6_1
  L11_1 = L1_1
  L12_1 = 120
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = MpCommon
  L9_1 = L9_1.GetPersistContext
  L10_1 = L6_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= nil then
    L10_1 = #L9_1
    if 4 < L10_1 then
      L10_1 = mp
      L10_1 = L10_1.ReportLowfi
      L11_1 = L6_1
      L12_1 = 3613929297
      L10_1(L11_1, L12_1)
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
