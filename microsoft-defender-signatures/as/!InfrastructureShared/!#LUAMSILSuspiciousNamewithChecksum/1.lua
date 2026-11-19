-- Threat: !InfrastructureShared
-- Name: !#LUA:MSILSuspiciousNamewithChecksum
-- Type: 13
-- MpAttributes: pea_has_checksum & pea_no_security

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() < 393216 then
  return mp.CLEAN
end
if string.find(l_0_0, "check#%d%d%d%d%d+%.exe$") ~= nil or string.find(l_0_0, "evoucher%.exe$") ~= nil or string.find(l_0_0, "paid_invoice%.exe$") ~= nil or string.find(l_0_0, "itvpn%.exe$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
