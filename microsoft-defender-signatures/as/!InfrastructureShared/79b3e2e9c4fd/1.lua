-- Threat: !InfrastructureShared
-- Name: 79b3e2e9c4fd
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and (l_0_0:sub(1, 2) == "\\\\" or l_0_0:sub(1, 3) == "\"\\\\" or l_0_0:sub(1, 3) == "'\\\\") then
  if l_0_0:find("remoteauditservice.exe$") then
    return mp.CLEAN
  end
  if l_0_0:find("sartorius.com\\.+\\smstsvc") then
    return mp.CLEAN
  end
  if l_0_0:find("bflinfsccm03.bfl.com\\.+\\smstsvc") then
    return mp.CLEAN
  end
  if l_0_0:find("\\\\.+\\c%$\\") or l_0_0:find("\\\\.+\\admin%$\\") then
    bm.add_threat_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
