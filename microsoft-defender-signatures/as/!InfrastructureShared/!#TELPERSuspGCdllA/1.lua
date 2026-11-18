-- Threat: !InfrastructureShared
-- Name: !#TELPER:SuspGCdll.A
-- Type: 10
-- MpAttributes: pea_isdll & pea_amd64_image & pea_hasexports & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 1048576 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_1 == 1 then
  local l_0_3 = pe.mmap_string_rva(l_0_2[1].namerva, 64)
  if l_0_3 == "GC_VersionInfo" then
    local l_0_4 = pe.query_import
    if 0 == l_0_4(pe.IMPORT_STATIC, 3306045273) then
      return mp.CLEAN
    end
    if 0 == l_0_4(pe.IMPORT_STATIC, 2141573459) then
      return mp.CLEAN
    end
    if 0 == l_0_4(pe.IMPORT_STATIC, 3604202544) then
      return mp.CLEAN
    end
    if 0 == l_0_4(pe.IMPORT_STATIC, 1712054030) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
