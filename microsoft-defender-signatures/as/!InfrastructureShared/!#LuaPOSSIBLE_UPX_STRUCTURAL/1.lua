-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPOSSIBLE_UPX_STRUCTURAL\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1 = 2
local l_0_2 = 1879048195
local l_0_3 = 1
if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if elfhdr.phnum < 2 or elfhdr.phnum > 16 then
  return mp.CLEAN
end
local l_0_4 = 0
for l_0_8 = 1, elfhdr.phnum do
  if (ephdrs[l_0_8]).type == l_0_3 then
    l_0_4 = l_0_4 + 1
  end
end
if l_0_4 ~= 2 then
  return mp.CLEAN
end
if elfhdr.shnum ~= 0 then
  if elfhdr.shnum > 3 then
    return mp.CLEAN
  end
  local l_0_9 = false
  for l_0_13 = 1, elfhdr.shnum do
    local l_0_14 = esec[l_0_13]
    if l_0_14.addr ~= 0 then
      return mp.CLEAN
    end
    if l_0_14.type == l_0_2 then
      l_0_9 = true
    end
  end
  if not l_0_9 then
    return mp.CLEAN
  end
end
do
  if elfhdr.phoff ~= elfhdr.ehsize then
    return mp.CLEAN
  end
  if elfhdr.phoff < 0 or mp.HEADERPAGE_SZ < elfhdr.phoff or elfhdr.phnum < 0 or elfhdr.phentsize <= 0 or (mp.HEADERPAGE_SZ - elfhdr.phoff) / elfhdr.phentsize < elfhdr.phnum then
    return mp.CLEAN
  end
  local l_0_15 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize
  local l_0_16 = 4
  local l_0_17 = 1685382481
  local l_0_18 = 0
  for l_0_22 = 1, elfhdr.phnum do
    local l_0_23 = (ephdrs[l_0_22]).type
    if l_0_23 == l_0_16 or l_0_23 == l_0_17 then
      local l_0_24 = (ephdrs[l_0_22]).filesz
      if l_0_24 < 0 then
        return mp.CLEAN
      end
      local l_0_25 = (4 - l_0_24 % 4) % 4
      if mp.HEADERPAGE_SZ - l_0_18 < l_0_24 or mp.HEADERPAGE_SZ - l_0_18 - l_0_24 < l_0_25 then
        return mp.CLEAN
      end
      l_0_18 = l_0_18 + l_0_24 + l_0_25
    end
  end
  if mp.HEADERPAGE_SZ - (l_0_18) - 12 < l_0_15 then
    return mp.CLEAN
  end
  local l_0_26 = l_0_15 + (l_0_18) + 12
  local l_0_27 = (string.byte)(elfhdr.ident, 6)
  local l_0_28 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
  local l_0_29 = 80
  local l_0_30 = l_0_28 - l_0_29
  local l_0_31 = l_0_28
  local l_0_32 = false
  local l_0_33, l_0_34, l_0_35, l_0_36 = nil, nil, nil, nil
  if l_0_27 == l_0_1 then
    l_0_36 = l_0_26 % 256
    local l_0_37 = (l_0_26 - l_0_36) / 256
    l_0_35 = l_0_37 % 256
    l_0_37 = (l_0_37 - l_0_35) / 256
    l_0_34 = l_0_37 % 256
    l_0_33 = (l_0_37 - l_0_34) / 256
  end
  do
    while 1 do
      while 1 do
        if l_0_30 <= l_0_31 and not l_0_32 then
          local l_0_38 = (mp.readu_u32)(footerpage, l_0_31 + 32)
          -- DECOMPILER ERROR at PC241: Overwrote pending register: R21 in 'AssignReg'

          if (((string.byte)(footerpage, l_0_31 + 32, l_0_31 + 35) == l_0_33 and footerpage == l_0_34 and l_0_31 + 32 == l_0_35 and l_0_31 + 35 == l_0_36) or l_0_38 == l_0_26) and l_0_26 < l_0_0 then
            l_0_32 = true
            -- DECOMPILER ERROR at PC248: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC248: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC248: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC248: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
      l_0_31 = l_0_31 - 1
    end
    do
      do
        if l_0_32 then
          local l_0_42 = l_0_28 - (l_0_31)
          if l_0_42 > 0 then
            (mp.set_mpattributeex)("Lua:POSSIBLE_UPX_STRUCTURAL_SHIFTED", l_0_42)
          end
          return mp.INFECTED
        end
        do return mp.CLEAN end
        -- DECOMPILER ERROR: 8 unprocessed JMP targets
      end
    end
  end
end

