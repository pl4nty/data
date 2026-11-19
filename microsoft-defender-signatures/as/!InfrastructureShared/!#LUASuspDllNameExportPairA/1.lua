-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspDllNameExportPair.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & pea_hasexports

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1, l_0_2 = pe.get_exports()
if l_0_0 ~= nil and 2 < l_0_1 and l_0_1 < 15 then
  l_0_0 = string.sub(l_0_0, 1, -5)
  for l_0_3 = 1, l_0_1 do
    local l_0_4 = pe.mmap_string_rva(l_0_2[l_0_3].namerva, 64)
    if l_0_4 ~= nil and string.lower(l_0_4) == l_0_0 then
      mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
