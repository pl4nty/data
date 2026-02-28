local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = "chrome.exe|msedge.exe|firefox.exe|iexplore.exe"
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L1_1 == L2_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_FILENAME
    L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    L2_1 = {}
    L2_1.vbs = true
    L2_1.ps1 = true
    L2_1[".js"] = true
    L2_1.jse = true
    L2_1.vbe = true
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = -3
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil then
      L4_1 = L2_1[L3_1]
      if L4_1 == true then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
