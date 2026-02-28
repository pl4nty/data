local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["winword.exe"] = true
  L3_1["excel.exe"] = true
  L3_1["powerpnt.exe"] = true
  L3_1["outlook.exe"] = true
  L3_1["olk.exe"] = true
  L3_1["acrord32.exe"] = true
  L3_1["foxit.exe"] = true
  L3_1["thunderbird.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = hstrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = {}
    L4_1["powershell.exe"] = true
    L4_1["pwsh.exe"] = true
    L4_1["cmd.exe"] = true
    L4_1["cscript.exe"] = true
    L4_1["wscript.exe"] = true
    L4_1["mshta.exe"] = true
    L4_1["chrome.exe"] = true
    L4_1["msedge.exe"] = true
    L4_1["firefox.exe"] = true
    L4_1["opera.exe"] = true
    L4_1["iexplore.exe"] = true
    L4_1["brave.exe"] = true
    L4_1["runtimebroker.exe"] = true
    L5_1 = L4_1[L2_1]
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
