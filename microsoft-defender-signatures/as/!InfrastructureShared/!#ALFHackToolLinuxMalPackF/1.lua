-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Linux/MalPack.F
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & RPF:TopLevelFile & !elfa_hasnosectionsheader

local l_0_0 = 1
local l_0_1 = 4
if elfhdr.shnum and elfhdr.shnum >= 2 then
  local l_0_2 = esec[elfhdr.shnum - 1]
  local l_0_3 = esec[elfhdr.shnum]
  if l_0_2 and l_0_3 then
    local l_0_4 = elf.GetSectionName(l_0_2.name)
    local l_0_5 = elf.GetSectionName(l_0_3.name)
    if l_0_4 and l_0_5 then
      local l_0_6 = string.match(l_0_4, "^[^%z]*") or l_0_4
      local l_0_7 = string.match(l_0_5, "^[^%z]*") or l_0_5
      if string.match(l_0_6, "^%.[A-Za-z][A-Za-z][A-Za-z]0$") and string.match(l_0_7, "^%.[A-Za-z][A-Za-z][A-Za-z]1$") then
        local l_0_8 = string.sub(l_0_6, 2, 4)
        local l_0_9 = string.sub(l_0_7, 2, 4)
        if l_0_8 == l_0_9 and string.lower(l_0_8) ~= "vmp" and l_0_2.type == l_0_0 and l_0_3.type == l_0_0 and mp.bitand(l_0_2.flags, l_0_1) ~= 0 and mp.bitand(l_0_3.flags, l_0_1) ~= 0 and 0 <= elfhdr.entry and 0 <= l_0_3.addr and 0 <= l_0_3.size and elfhdr.entry >= l_0_3.addr and elfhdr.entry - l_0_3.addr < l_0_3.size then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
