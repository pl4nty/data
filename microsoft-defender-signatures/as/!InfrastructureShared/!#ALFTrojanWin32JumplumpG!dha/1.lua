-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Jumplump.G!dha
-- Type: 9
-- MpAttributes: pea_hasexports & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and (l_0_0:find("applicationframe", 1, true) or l_0_0:find("wmiprvsd", 1, true) or l_0_0:find("wuapi", 1, true) or l_0_0:find("propsys", 1, true) or l_0_0:find("wbemprox", 1, true) or l_0_0:find("actioncenter", 1, true)) then
  local l_0_1 = {
    ShareProviderInitialize = "",
    ShareProviderUninitialize = "",
    ShareProviderShareAdd = "",
    ShareProviderShareSetInfo = "",
    ShareProviderShareDel = ""
  }
  local l_0_2, l_0_3 = pe.get_exports()
  if 3 < l_0_2 then
    for l_0_4 = 1, l_0_2 do
      local l_0_5 = pe.mmap_string_rva(l_0_3[l_0_4].namerva, 64)
      if l_0_1[l_0_5] then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
