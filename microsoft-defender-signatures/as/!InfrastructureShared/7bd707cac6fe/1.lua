local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "java.exe"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "javaw.exe"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      goto lbl_28
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  goto lbl_37
  ::lbl_28::
  L2_1 = TrackPidAndTechnique
  L3_1 = "CMDHSTR"
  L4_1 = "T1057"
  L5_1 = "discovery_lsass"
  L6_1 = 86400
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_37::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
