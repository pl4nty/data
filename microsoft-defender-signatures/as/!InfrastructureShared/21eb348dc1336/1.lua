local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 1) then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L1_1 = string
L1_1 = L1_1.find
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = "\\program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = "\\mpsigstub.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = "\\mpcmdrun.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_57
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_57::
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L1_1 < 20000000 then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1573.001"
  L4_1 = "EncryptedTrafficOverHttp"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
