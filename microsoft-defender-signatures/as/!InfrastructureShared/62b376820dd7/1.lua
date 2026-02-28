local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = 150000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.wp1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "[^>](.-)([^\\/]-%.?([^%.\\/]*))$"
    L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
    if L4_1 == nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = {}
    L7_1 = "wget"
    L8_1 = "curl"
    L9_1 = "ssh"
    L10_1 = "sshd"
    L11_1 = "openssl"
    L12_1 = "ccrypt"
    L13_1 = "gpg"
    L14_1 = "shred"
    L15_1 = "dd"
    L16_1 = "bash"
    L17_1 = "tcsh"
    L18_1 = "ksh"
    L19_1 = "dash"
    L20_1 = "zsh"
    L6_1[1] = L7_1
    L6_1[2] = L8_1
    L6_1[3] = L9_1
    L6_1[4] = L10_1
    L6_1[5] = L11_1
    L6_1[6] = L12_1
    L6_1[7] = L13_1
    L6_1[8] = L14_1
    L6_1[9] = L15_1
    L6_1[10] = L16_1
    L6_1[11] = L17_1
    L6_1[12] = L18_1
    L6_1[13] = L19_1
    L6_1[14] = L20_1
    L7_1 = pairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L4_1
      L14_1 = L11_1
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 then
        L12_1 = mp
        L12_1 = L12_1.CLEAN
        return L12_1
      end
    end
  end
end
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1036.003"
L5_1 = "CopyLolbin_DefenseEvasion"
L2_1(L3_1, L4_1, L5_1)
L2_1 = RemediateProcessTreeForLinux
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
