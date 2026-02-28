local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1110.001"
L4_1 = "CredentialAccess_SshBruteForceOutgoing"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/usr/sbin/sshd"
  L5_1 = -14
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1.image_path
    L4_1 = "/usr/sbin/sshd"
    L5_1 = -14
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      goto lbl_37
    end
  end
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1.ppid
  L4_1 = "T1110.001"
  L5_1 = "CredentialAccess_SshBruteForceOutgoing"
  L2_1(L3_1, L4_1, L5_1)
end
::lbl_37::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
