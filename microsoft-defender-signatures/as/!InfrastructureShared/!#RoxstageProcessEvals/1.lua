local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdriver
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdamaged
    if not L0_1 then
      goto lbl_16
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_RoxstageProcessEval"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_RoxstageProcessBlock"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    goto lbl_69
  end
end
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L1_1 = L1_1(L2_1)
  if L1_1 ~= true then
    goto lbl_69
  end
end
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L1_1 = L1_1(L2_1)
  ::lbl_69::
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILE_AGE
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 ~= nil and 7200 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L2_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L4_1 = MpCommon
L4_1 = L4_1.ExpandEnvironmentVariables
L5_1 = "%programfiles(x86)%"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil and L4_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L3_1
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%programfiles%"
L5_1 = L5_1(L6_1)
if L5_1 ~= nil and L5_1 ~= "" then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L5_1
  L8_1 = L8_1(L9_1)
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = MpCommon
L6_1 = L6_1.QueryPersistContext
L7_1 = L2_1
L8_1 = "BM_RoxstageProcessEval"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.QueryPersistContext
L7_1 = L2_1
L8_1 = "BM_RoxstageProcessBlock"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.IsTrustedFile
L7_1 = false
L6_1 = L6_1(L7_1)
if L6_1 == true then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.GetPersistContextCountNoPath
L7_1 = "roxstagePersistedProcs"
L6_1 = L6_1(L7_1)
if 15 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.set_mpattribute
L8_1 = "BM_RoxstageProcessEval"
L7_1(L8_1)
L7_1 = MpCommon
L7_1 = L7_1.AppendPersistContext
L8_1 = L2_1
L9_1 = "BM_RoxstageProcessEval"
L10_1 = 0
L7_1(L8_1, L9_1, L10_1)
if L6_1 == 0 then
  L7_1 = {}
  L8_1 = table
  L8_1 = L8_1.insert
  L9_1 = L7_1
  L10_1 = L2_1
  L8_1(L9_1, L10_1)
  L8_1 = MpCommon
  L8_1 = L8_1.SetPersistContextNoPath
  L9_1 = "roxstagePersistedProcs"
  L10_1 = L7_1
  L11_1 = 0
  L8_1(L9_1, L10_1, L11_1)
else
  L7_1 = MpCommon
  L7_1 = L7_1.AppendPersistContextNoPath
  L8_1 = "roxstagePersistedProcs"
  L9_1 = L2_1
  L10_1 = 0
  L7_1(L8_1, L9_1, L10_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
