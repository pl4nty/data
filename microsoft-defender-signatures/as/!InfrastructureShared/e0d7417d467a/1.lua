local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
    L3_1 = {}
    L3_1["microsoft.office.datacenter.torus.powershellworker.exe"] = true
    L3_1["citrix.wem.agent.service.exe"] = true
    L3_1["powershell_ise.exe"] = true
    L3_1["code.exe"] = true
    L3_1["ccmexec.exe"] = true
    L3_1["gpscript.exe"] = true
    L3_1["mpcmdrun.exe"] = true
    L3_1["mssense.exe"] = true
    L3_1["senseir.exe"] = true
    L4_1 = L3_1[L2_1]
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = IsPidExcluded
    L5_1 = L0_1.ppid
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = IsDetectionThresholdMet
    L5_1 = L0_1.ppid
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.LOWFI
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
