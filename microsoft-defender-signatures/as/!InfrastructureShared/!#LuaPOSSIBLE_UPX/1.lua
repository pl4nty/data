-- Threat: !InfrastructureShared
-- Name: !#Lua:POSSIBLE_UPX
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
local l_0_9 = elfhdr.ident
local l_0_10 = string.byte(l_0_9, 6)
if elfhdr.phoff ~= elfhdr.ehsize then
  return mp.CLEAN
end
local l_0_11 = elfhdr.phoff
if 0 > elfhdr.phoff or elfhdr.phoff > mp.HEADERPAGE_SZ or elfhdr.phnum < 0 or 0 >= elfhdr.phentsize or elfhdr.phnum > (mp.HEADERPAGE_SZ - elfhdr.phoff) / elfhdr.phentsize then
  return mp.CLEAN
end
l_0_11 = l_0_11 + elfhdr.phnum * elfhdr.phentsize
local l_0_12 = 4
local l_0_13 = 1685382481
local l_0_14 = 0
for l_0_15 = 1, elfhdr.phnum do
  local l_0_16 = ephdrs[l_0_15].type
  if l_0_16 == l_0_12 or l_0_16 == l_0_13 then
    local l_0_17 = ephdrs[l_0_15].filesz
    if l_0_17 < 0 then
      return mp.CLEAN
    end
    local l_0_18 = (4 - l_0_17 % 4) % 4
    if l_0_17 > mp.HEADERPAGE_SZ - l_0_14 or l_0_18 > mp.HEADERPAGE_SZ - l_0_14 - l_0_17 then
      return mp.CLEAN
    end
    l_0_14 = l_0_14 + l_0_17 + l_0_18
  end
end
if l_0_11 > mp.HEADERPAGE_SZ - l_0_14 - 5 then
  return mp.CLEAN
end
local l_0_19 = l_0_11 + l_0_14 + 4 + 1
if l_0_19 < mp.HEADERPAGE_SZ - 3 then
  local l_0_20 = mp.readu_u32(headerpage, l_0_19)
  if l_0_20 == 0 then
    return mp.CLEAN
  end
  local l_0_21 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
  local l_0_22 = mp.readu_u32(footerpage, l_0_21)
  local l_0_24 = l_0_22 == l_0_20
  local l_0_25
  if not l_0_24 then
    local l_0_26 = 80
    local l_0_27 = l_0_21 - l_0_26
    repeat
      l_0_21 = l_0_21 - 1
      l_0_25 = mp.readu_u32(footerpage, l_0_21)
      l_0_24 = l_0_25 == l_0_20
    until l_0_24 or l_0_27 >= l_0_21
  end
  if not l_0_24 then
    return mp.CLEAN
  end
  local l_0_28 = l_0_21 + 32
  local l_0_29 = mp.readu_u32(footerpage, l_0_28)
  local l_0_30, l_0_31, l_0_32, l_0_33
  if l_0_10 == l_0_1 then
    l_0_30, l_0_31, l_0_32, l_0_33 = string.byte(footerpage, l_0_28, l_0_28 + 3)
  end
  if l_0_11 > mp.HEADERPAGE_SZ - l_0_14 - 12 then
    return mp.CLEAN
  end
  local l_0_34 = l_0_11 + l_0_14 + 12
  local l_0_36 = l_0_29 == l_0_34
  if l_0_10 == l_0_1 then
    local l_0_37 = l_0_34
    local l_0_38 = l_0_37 % 256
    l_0_37 = (l_0_37 - l_0_38) / 256
    local l_0_39 = l_0_37 % 256
    l_0_37 = (l_0_37 - l_0_39) / 256
    local l_0_40 = l_0_37 % 256
    l_0_36 = l_0_30 == (l_0_37 - l_0_40) / 256 and l_0_31 == l_0_40 and l_0_32 == l_0_39 and l_0_33 == l_0_38
  end
  if l_0_0 < l_0_34 or not l_0_36 then
    return mp.CLEAN
  end
  local l_0_41 = false
  local l_0_42 = l_0_21 - 16
  local l_0_43
  while l_0_21 > l_0_42 and not l_0_41 do
    l_0_43 = mp.readu_u32(footerpage, l_0_42)
    l_0_41 = l_0_43 == l_0_20
    l_0_42 = l_0_42 + 1
  end
  if l_0_41 then
    mp.set_mpattributeex("Lua:POSSIBLE_UPX_MAGIC", l_0_20)
    return mp.INFECTED
  end
end
return mp.CLEAN
