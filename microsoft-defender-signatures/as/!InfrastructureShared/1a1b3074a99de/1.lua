local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if 15 <= L1_1 then
    L1_1 = {}
    L1_1["msmpeng.exe"] = true
    L1_1["mpcmd.exe"] = true
    L1_1["mpcmdrun.exe"] = true
    L1_1["resetengine.exe"] = true
    L1_1["svchost.exe"] = true
    L1_1["wuauclt.exe"] = true
    L1_1["dismhost.exe"] = true
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L0_1
    L5_1 = -15
    L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "\\([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = L1_1[L2_1]
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1562.001"
L4_1 = "mptamper_cipolicy"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
