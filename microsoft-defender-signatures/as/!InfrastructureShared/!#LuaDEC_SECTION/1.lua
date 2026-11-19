-- Threat: !InfrastructureShared
-- Name: !#Lua:DEC_SECTION
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & RPF:TopLevelFile & !elfa_hasnosectionsheader

for l_0_0 = 1, elfhdr.shnum do
  local l_0_1 = esec[l_0_0]
  local l_0_2 = elf.GetSectionName(l_0_1.name)
  if l_0_2 == ".dec" or string.sub(l_0_2, 1, 5) == ".dec\000" or l_0_2 == ".decryption" or string.sub(l_0_2, 1, 12) == ".decryption\000" then
    return mp.INFECTED
  end
end
return mp.CLEAN
