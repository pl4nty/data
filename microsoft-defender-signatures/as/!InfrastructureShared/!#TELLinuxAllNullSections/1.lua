-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/AllNullSections
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & !elfa_hasnosectionsheader & RPF:TopLevelFile

local l_0_0 = 8
for l_0_1 = 1, elfhdr.shnum do
  local l_0_2 = esec[l_0_1]
  if l_0_2.type ~= l_0_0 and (l_0_2.offset ~= 0 or l_0_2.size ~= 0 or l_0_2.flags ~= 0 or l_0_2.addr ~= 0 or l_0_2.link ~= 0 or l_0_2.info ~= 0 or l_0_2.addralign ~= 0 or l_0_2.entsize ~= 0) then
    return mp.CLEAN
  end
end
mp.set_mpattribute("MpEnableSegmentBasedElfScanning")
return mp.INFECTED
