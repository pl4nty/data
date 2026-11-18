-- Threat: !InfrastructureShared
-- Name: !#Lua:NodeJSPacker.SEA
-- Type: 10
-- MpAttributes: NID:Program:Win32/NodeJS

local function l_0_0(l_1_0, l_1_1, l_1_2, l_1_3)
  local l_1_4 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA
  
  local l_1_5 = l_1_4 + l_1_0
  if not (l_1_5 and pe.contains_rva(l_1_3, l_1_5)) or not pe.contains_rva(l_1_3, l_1_5 + 16) then
    return nil
  end
  local l_1_6 = pe.mmap_rva(l_1_5, 16)
  local l_1_7 = mp.readu_u16(l_1_6, 13) + mp.readu_u16(l_1_6, 15)
  if 10 <= l_1_7 then
    return nil
  end
  local l_1_8 = l_1_5 + 16
  if not pe.contains_rva(l_1_3, l_1_8) or not pe.contains_rva(l_1_3, l_1_8 + l_1_7 * 8) then
    return nil
  end
  local l_1_9 = pe.mmap_rva(l_1_8, l_1_7 * 8)
  for l_1_10 = 1, l_1_7 * 8, 8 do
    local l_1_11 = mp.readu_u32(l_1_9, l_1_10)
    if l_1_1 == 1 and l_1_11 == l_1_2 then
      return mp.bitand(mp.readu_u32(l_1_9, l_1_10 + 4), 2147483647)
    elseif l_1_1 == 2 and mp.bitand(l_1_11, 2147483648) then
      local l_1_12 = mp.bitand(l_1_11, 2147483647)
      local l_1_13 = l_1_4 + l_1_12
      if not pe.contains_rva(l_1_3, l_1_13) or not pe.contains_rva(l_1_3, l_1_13 + 2) then
        return false
      end
      if mp.readu_u16(pe.mmap_rva(l_1_13, 2), 1) == #l_1_2 then
        local l_1_14 = pe.mmap_rva(l_1_13 + 2, #l_1_2 * 2) .. "\000\000"
        if mp.utf16to8(l_1_14) == l_1_2 then
          return l_1_12
        end
      end
    end
  end
  return nil
end

if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA == 0 or pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA == nil then
  return mp.CLEAN
end
local l_0_1 = pehdr.NumberOfSections < 10 and pehdr.NumberOfSections or 10
local l_0_2 = -1
for l_0_3 = 1, l_0_1 do
  if pe.contains_rva(l_0_3, pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA) then
    l_0_2 = l_0_3
  end
end
if l_0_2 == -1 then
  return mp.CLEAN
end
local l_0_4 = l_0_0(0, 1, 10, l_0_2)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_0(l_0_4, 2, "NODE_SEA_BLOB", l_0_2)
if l_0_5 == nil then
  return mp.CLEAN
end
return mp.INFECTED
