-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Win64/SteelStrider.A!dha
-- Type: 9
-- MpAttributes: pea_isdll & pea_hasexports & pea_amd64_image & LUA:FileSizeGT10M.A & LUA:FileSizeLE20M.B

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 < 10 or 400 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3 = 1, l_0_0 do
  local l_0_4 = pe.mmap_string_rva(l_0_1[l_0_3].namerva, 64)
  if l_0_4 == "ExtractEdgePasswordsToFile" or l_0_4 == "ExtractEdgePasswords" then
    l_0_2 = l_0_2 + 1
    if l_0_2 == 2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
