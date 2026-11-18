-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/AllSectionsOverflow
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & !elfa_hasnosectionsheader & RPF:TopLevelFile

local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = mp.getfilesize()
local l_0_3 = false
local l_0_4 = false
for l_0_5 = 1, elfhdr.shnum do
  local l_0_6 = esec[l_0_5]
  if l_0_6.type ~= l_0_0 and l_0_6.type ~= l_0_1 then
    l_0_4 = true
    if 0 <= l_0_6.offset and l_0_2 > l_0_6.offset and 0 <= l_0_6.size and l_0_6.size <= l_0_2 - l_0_6.offset then
      l_0_3 = true
      break
    end
  end
end
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
