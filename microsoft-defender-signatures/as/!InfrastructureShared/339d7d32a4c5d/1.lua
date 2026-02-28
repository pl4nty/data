local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = IsExchangeServer
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == "w3wp.exe" then
      L2_1 = L0_1.ppid
      if L2_1 == "" or L2_1 == nil then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = mp
      L4_1 = L4_1.GetProcessCommandLine
      L5_1 = L2_1
      L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "-ap \""
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = TrackPidAndTechnique
        L5_1 = L2_1
        L6_1 = "T1505.003"
        L7_1 = "webshell_parent"
        L8_1 = 604800
        L4_1(L5_1, L6_1, L7_1, L8_1)
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
