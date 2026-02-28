local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringEndsWith
L3_1 = L1_1
L4_1 = "/smbclient"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = StringEndsWith
  L3_1 = L1_1
  L4_1 = "/vsftpd"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = StringEndsWith
    L3_1 = L1_1
    L4_1 = "/ftp"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = StringEndsWith
      L3_1 = L1_1
      L4_1 = "/netkit-fp"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L2_1 = StringEndsWith
        L3_1 = L1_1
        L4_1 = "/sftp-server"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          L2_1 = StringEndsWith
          L3_1 = L1_1
          L4_1 = "/sshd"
          L2_1 = L2_1(L3_1, L4_1)
          if not L2_1 then
            goto lbl_77
          end
        end
      end
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p2
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = taint
L3_1 = L0_1
L4_1 = "remote_file_created_taint"
L5_1 = 3600
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.ReportLowfi
L3_1 = L0_1
L4_1 = 3672992343
L2_1(L3_1, L4_1)
::lbl_77::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
