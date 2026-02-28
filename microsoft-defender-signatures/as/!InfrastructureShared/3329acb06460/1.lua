local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "PACKED_WITH:(Base64)"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "%-%>%(Base64%)"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      goto lbl_56
    end
  end
  L1_1 = mp
  L1_1 = L1_1.readprotection
  L2_1 = false
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if L1_1 < 32767 then
    L2_1 = mp
    L2_1 = L2_1.readfile
    L3_1 = 0
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L2_1
    L3_1 = L2_1.gmatch
    L5_1 = ".:\\users\\.-\\startup\\[^%s]*"
    L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
    for L6_1 in L3_1, L4_1, L5_1 do
      L7_1 = AppendToRollingQueue
      L8_1 = "PoshevinRelatedFiles"
      L9_1 = L6_1
      L10_1 = nil
      L11_1 = 5000
      L7_1(L8_1, L9_1, L10_1, L11_1)
    end
    L3_1 = TrackPidAndTechnique
    L4_1 = "AMSI"
    L5_1 = "T1037"
    L6_1 = "b64_script_refers_startup"
    L3_1(L4_1, L5_1, L6_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_56::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
