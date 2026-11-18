-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/OneOrMoreSectionOverflow
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & !elfa_hasnosectionsheader & RPF:TopLevelFile

local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = mp.getfilesize()
for l_0_3 = 1, elfhdr.shnum do
  local l_0_4 = esec[l_0_3]
  if l_0_4.type ~= l_0_0 and l_0_4.type ~= l_0_1 and (0 > l_0_4.offset or 0 > l_0_4.size or l_0_2 < l_0_4.offset or l_0_4.size > l_0_2 - l_0_4.offset) then
    return mp.INFECTED
  end
end
return mp.CLEAN
