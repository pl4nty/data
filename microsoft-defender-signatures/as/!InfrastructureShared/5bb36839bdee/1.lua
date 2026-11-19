-- Threat: !InfrastructureShared
-- Name: 5bb36839bdee
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0
local l_0_1 = bm.get_imagepath()
if not l_0_1 then
  return mp.CLEAN
end
if StringEndsWith(l_0_1, "/smbclient") or StringEndsWith(l_0_1, "/vsftpd") or StringEndsWith(l_0_1, "/ftp") or StringEndsWith(l_0_1, "/netkit-fp") or StringEndsWith(l_0_1, "/sftp-server") or StringEndsWith(l_0_1, "/sshd") then
  if this_sigattrlog[1].matched then
    l_0_0 = this_sigattrlog[1].utf8p2
  elseif this_sigattrlog[2].matched then
    l_0_0 = this_sigattrlog[2].utf8p2
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  taint(l_0_0, "remote_file_created_taint", 3600)
  mp.ReportLowfi(l_0_0, 3672992343)
end
return mp.CLEAN
