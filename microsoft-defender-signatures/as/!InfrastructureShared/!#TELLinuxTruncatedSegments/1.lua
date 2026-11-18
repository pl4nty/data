-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/TruncatedSegments
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & elfa_hasnosectionsheader

local l_0_0 = mp.getfilesize()
for l_0_1 = 1, elfhdr.phnum do
  local l_0_2 = ephdrs[l_0_1].offset
  local l_0_3 = ephdrs[l_0_1].filesz
  if 0 < l_0_3 and (l_0_2 < 0 or l_0_0 < l_0_2 or l_0_3 > l_0_0 - l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
