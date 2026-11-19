-- Threat: !InfrastructureShared
-- Name: !#Lua:ZeroSections
-- Type: 35
-- MpAttributes: RPF:TopLevelFile & BM_ELF_FILE & !elfa_hasnosectionsheader

local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 then
  return mp.CLEAN
end
for l_0_1 = 1, elfhdr.shnum do
  local l_0_2 = esec[l_0_1]
  if l_0_2.offset ~= 0 or l_0_2.size ~= 0 then
    return mp.CLEAN
  end
end
return mp.INFECTED
