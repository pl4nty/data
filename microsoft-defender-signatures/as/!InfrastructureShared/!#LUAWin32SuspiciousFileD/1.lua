-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFileD
-- Type: 13

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("RPF:IsoIsoExt") and mp.get_mpattribute("LUA:FileSizeLE1M.A") and string.find(l_0_0, ",pdf.iso", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
