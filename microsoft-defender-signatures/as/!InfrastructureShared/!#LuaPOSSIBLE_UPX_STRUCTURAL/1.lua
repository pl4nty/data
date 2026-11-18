-- Threat: !InfrastructureShared
-- Name: !#Lua:POSSIBLE_UPX_STRUCTURAL
-- Type: 35
-- MpAttributes: elfa_hasnosectionsheader | BM_ELF_EM_ARM

local l_0_0 = mp.getfilesize()
local l_0_1 = 2
local l_0_2 = 1879048195
local l_0_3 = 1
if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if 2 > elfhdr.phnum or elfhdr.phnum > 16 then
  return mp.CLEAN
end
local l_0_4 = 0
for l_0_5 = 1, elfhdr.phnum do
  if ephdrs[l_0_5].type == l_0_3 then
    l_0_4 = l_0_4 + 1
  end
end
if l_0_4 ~= 2 then
  return mp.CLEAN
end
if elfhdr.shnum ~= 0 then
  if 3 < elfhdr.shnum then
    return mp.CLEAN
  end
  local l_0_6 = false
  for l_0_7 = 1, elfhdr.shnum do
    local l_0_8 = esec[l_0_7]
    if l_0_8.addr ~= 0 then
      return mp.CLEAN
    end
    if l_0_8.type == l_0_2 then
      l_0_6 = true
    end
  end
  if not l_0_6 then
    return mp.CLEAN
  end
end
if elfhdr.phoff ~= elfhdr.ehsize then
  return mp.CLEAN
end
local l_0_9 = elfhdr.phoff
if 0 > elfhdr.phoff or elfhdr.phoff > mp.HEADERPAGE_SZ or elfhdr.phnum < 0 or 0 >= elfhdr.phentsize or elfhdr.phnum > (mp.HEADERPAGE_SZ - elfhdr.phoff) / elfhdr.phentsize then
  return mp.CLEAN
end
l_0_9 = l_0_9 + elfhdr.phnum * elfhdr.phentsize
local l_0_10 = 4
local l_0_11 = 1685382481
local l_0_12 = 0
for l_0_13 = 1, elfhdr.phnum do
  local l_0_14 = ephdrs[l_0_13].type
  if l_0_14 == l_0_10 or l_0_14 == l_0_11 then
    local l_0_15 = ephdrs[l_0_13].filesz
    if l_0_15 < 0 then
      return mp.CLEAN
    end
    local l_0_16 = (4 - l_0_15 % 4) % 4
    if l_0_15 > mp.HEADERPAGE_SZ - l_0_12 or l_0_16 > mp.HEADERPAGE_SZ - l_0_12 - l_0_15 then
      return mp.CLEAN
    end
    l_0_12 = l_0_12 + l_0_15 + l_0_16
  end
end
if l_0_9 > mp.HEADERPAGE_SZ - l_0_12 - 12 then
  return mp.CLEAN
end
local l_0_17 = l_0_9 + l_0_12 + 12
local l_0_18 = string.byte(elfhdr.ident, 6)
local l_0_19 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
local l_0_20 = 80
local l_0_21 = l_0_19 - l_0_20
local l_0_22 = l_0_19
local l_0_23 = false
local l_0_24, l_0_25, l_0_26, l_0_27
if l_0_18 == l_0_1 then
  l_0_27 = l_0_17 % 256
  local l_0_28 = (l_0_17 - l_0_27) / 256
  l_0_26 = l_0_28 % 256
  l_0_28 = (l_0_28 - l_0_26) / 256
  l_0_25 = l_0_28 % 256
  l_0_24 = (l_0_28 - l_0_25) / 256
end
while l_0_21 <= l_0_22 and not l_0_23 do
  local l_0_29 = mp.readu_u32(footerpage, l_0_22 + 32)
  local l_0_31 = l_0_29 == l_0_17
  if l_0_18 == l_0_1 then
    local l_0_32, l_0_33, l_0_34, l_0_35 = string.byte(footerpage, l_0_22 + 32, l_0_22 + 35)
    l_0_31 = l_0_32 == l_0_24 and l_0_33 == l_0_25 and l_0_34 == l_0_26 and l_0_35 == l_0_27
  end
  if l_0_31 and l_0_0 > l_0_17 then
    l_0_23 = true
  else
    l_0_22 = l_0_22 - 1
  end
end
if l_0_23 then
  local l_0_36 = l_0_19 - l_0_22
  if 0 < l_0_36 then
    mp.set_mpattributeex("Lua:POSSIBLE_UPX_STRUCTURAL_SHIFTED", l_0_36)
  end
  return mp.INFECTED
end
return mp.CLEAN
