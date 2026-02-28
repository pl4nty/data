local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetCtxOfficeProc
L0_1 = L0_1()
if L0_1 ~= "productivity2" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 == nil then
  L1_1 = ""
  if L1_1 then
    goto lbl_44
  end
end
L1_1 = L0_1
::lbl_44::
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = MpCommon
L1_1 = L1_1.ExpandEnvironmentVariables
L2_1 = "%windir%"
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = ""
  if L2_1 then
    goto lbl_57
  end
end
L2_1 = L1_1
::lbl_57::
L3_1 = L2_1
L2_1 = L2_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L0_1 ~= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
