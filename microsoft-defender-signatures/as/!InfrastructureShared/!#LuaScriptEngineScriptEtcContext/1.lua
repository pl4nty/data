local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "[^\\]+$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L2_1["iexplore.exe"] = ""
L2_1["chrome.exe"] = ""
L2_1["firefox.exe"] = ""
L3_1 = {}
L3_1["wscript.exe"] = ""
L3_1["cscript.exe"] = ""
if L1_1 ~= nil then
  L4_1 = L2_1[L1_1]
  if not L4_1 then
    goto lbl_38
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_38::
L4_1 = L3_1[L1_1]
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
