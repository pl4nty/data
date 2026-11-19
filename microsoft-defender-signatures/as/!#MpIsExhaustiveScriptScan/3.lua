-- Threat: !#MpIsExhaustiveScriptScan
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, ".cache", 1, true) and (string.find(l_0_0, "windows\\servicestate\\winhttpautoproxysvc", 1, true) or string.find(l_0_0, "windows\\serviceprofiles\\localservice\\winhttp", 1, true)) then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
