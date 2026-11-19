-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFileAMM
-- Type: 13
-- MpAttributes: pea_isexe & pea_no_debug & pea_hasappendeddata & LUA:FileSizeGE1000.A & BM_DropperObfuscatorUR & Exploit:Win32/Wintuds.B.3 & SIGATTR:Obfuscator_LoadLibraryFileMissing.SYSTEM32.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "facturas pagadas al vencimientopdf.exe", 1, true) ~= nil or string.find(l_0_0, "panderizes sagenesses.exe", 1, true) ~= nil or string.find(l_0_0, "trrester incutting.exe", 1, true) ~= nil or string.find(l_0_0, "sedile.exe", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
