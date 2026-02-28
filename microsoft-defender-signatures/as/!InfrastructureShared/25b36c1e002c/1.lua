local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = {}
L1_1["explorer.exe"] = true
L1_1["outlook.exe"] = true
L1_1["winword.exe"] = true
L1_1["excel.exe"] = true
L1_1["msedge.exe"] = true
L1_1["chrome.exe"] = true
L1_1["firefox.exe"] = true
L1_1["winrar.exe"] = true
L1_1["winzip.exe"] = true
L1_1["7zfm.exe"] = true
L1_1["olk.exe"] = true
L2_1 = checkParentProcessNameFromListByPPID
L3_1 = L0_1.ppid
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = AddResearchData
L3_1 = L0_1.ppid
L4_1 = true
L2_1(L3_1, L4_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
