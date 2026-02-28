local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
if L0_1 == "" or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringEndsWith
L3_1 = L0_1
L4_1 = ":\\perflogs"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = StringEndsWith
  L3_1 = L0_1
  L4_1 = ":\\users\\public\\music"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = StringEndsWith
    L3_1 = L0_1
    L4_1 = ":\\users\\public"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = {}
L2_1["chrome.exe"] = true
L2_1["explorer.exe"] = true
L2_1["swchost.exe"] = true
L2_1["svchost.exe"] = true
L2_1["svvhost.exe"] = true
L2_1["svchost.dll"] = true
L3_1 = false
L4_1 = L2_1[L1_1]
if L4_1 then
  L3_1 = true
end
if not L3_1 then
  L4_1 = contains
  L5_1 = L1_1
  L6_1 = {}
  L7_1 = "pagefile%w+%.exe"
  L8_1 = "swapfile%w+%.exe"
  L9_1 = "tmuninst%w+%.exe"
  L10_1 = "toolbox_client_uninst%w+%.exe"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L6_1[3] = L9_1
  L6_1[4] = L10_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L3_1 = true
  end
end
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.IsTrustedFile
  L5_1 = false
  L4_1 = L4_1(L5_1)
  if L4_1 == true then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
