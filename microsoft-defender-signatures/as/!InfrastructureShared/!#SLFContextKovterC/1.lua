local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:ContextFileInFirstFolder.B!appdata"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:ContextFileInFirstFolder.B!localappdata"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:ContextFileInFirstFolder.B!locallowappdata"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_119
    end
  end
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\temp\\"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_50
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_50::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 5) then
    goto lbl_69
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_69::
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "([^\\%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.len
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 <= 3 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_SCANREASON
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONOPEN
if L3_1 ~= L4_1 then
  L4_1 = mp
  L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L3_1 ~= L4_1 then
    goto lbl_116
  end
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_NEWLYCREATEDHINT
L4_1 = L4_1(L5_1)
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
  L4_1 = L4_1(L5_1)
  if L4_1 ~= nil then
    L5_1 = MpCommon
    L5_1 = L5_1.RequestSmsOnProcess
    L6_1 = L4_1
    L7_1 = MpCommon
    L7_1 = L7_1.SMS_SCAN_MED
    L5_1(L6_1, L7_1)
  end
end
::lbl_116::
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_119::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
