-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPOSSIBLE_UPX\1.luac 

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
  local l_0_15 = elfhdr.ident
  local l_0_16 = (string.byte)(l_0_15, 6)
  if elfhdr.phoff ~= elfhdr.ehsize then
    return mp.CLEAN
  end
  if elfhdr.phoff < 0 or mp.HEADERPAGE_SZ < elfhdr.phoff or elfhdr.phnum < 0 or elfhdr.phentsize <= 0 or (mp.HEADERPAGE_SZ - elfhdr.phoff) / elfhdr.phentsize < elfhdr.phnum then
    return mp.CLEAN
  end
  local l_0_17 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize
  local l_0_18 = 4
  local l_0_19 = 1685382481
  local l_0_20 = 0
  for l_0_24 = 1, elfhdr.phnum do
    local l_0_25 = (ephdrs[l_0_24]).type
    if l_0_25 == l_0_18 or l_0_25 == l_0_19 then
      local l_0_26 = (ephdrs[l_0_24]).filesz
      if l_0_26 < 0 then
        return mp.CLEAN
      end
      local l_0_27 = (4 - l_0_26 % 4) % 4
      if mp.HEADERPAGE_SZ - l_0_20 < l_0_26 or mp.HEADERPAGE_SZ - l_0_20 - l_0_26 < l_0_27 then
        return mp.CLEAN
      end
      l_0_20 = l_0_20 + l_0_26 + l_0_27
    end
  end
  if mp.HEADERPAGE_SZ - (l_0_20) - 5 < l_0_17 then
    return mp.CLEAN
  end
  do
    local l_0_28 = l_0_17 + (l_0_20) + 4 + 1
    if l_0_28 < mp.HEADERPAGE_SZ - 3 then
      local l_0_29 = (mp.readu_u32)(headerpage, l_0_28)
      if l_0_29 == 0 then
        return mp.CLEAN
      end
      local l_0_30 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
      local l_0_31 = (mp.readu_u32)(footerpage, l_0_30)
      local l_0_35 = l_0_31 == l_0_29
      repeat
        -- DECOMPILER ERROR at PC233: Overwrote pending register: R16 in 'AssignReg'

      until (nil ~= l_0_29 and l_0_35) or l_0_30 <= l_0_30 - 80
      if not l_0_35 then
        return mp.CLEAN
      end
      local l_0_36 = nil
      local l_0_37 = nil
      local l_0_38, l_0_39, l_0_40, l_0_41 = ((mp.readu_u32)(footerpage, l_0_30 + 32)), nil, nil, nil
      -- DECOMPILER ERROR at PC262: Overwrote pending register: R22 in 'AssignReg'

      if l_0_16 ~= l_0_1 or mp.HEADERPAGE_SZ - (l_0_20) - 12 < l_0_17 then
        return mp.CLEAN
      end
      local l_0_42 = nil
      -- DECOMPILER ERROR at PC283: Confused about usage of register: R23 in 'UnsetPending'

      if l_0_16 == l_0_1 then
        local l_0_45 = nil
        local l_0_46 = l_0_38 == l_0_17 + (l_0_20) + 12
        -- DECOMPILER ERROR at PC285: Confused about usage of register: R25 in 'UnsetPending'

        local l_0_47 = nil
        l_0_47 = (l_0_47 - (l_0_17 + (l_0_20) + 12 - (l_0_17 + (l_0_20) + 12) % 256) / 256 % 256) / 256
        local l_0_48 = nil
        -- DECOMPILER ERROR at PC295: Confused about usage of register: R28 in 'UnsetPending'

        -- DECOMPILER ERROR at PC297: Confused about usage of register: R27 in 'UnsetPending'

        l_0_46 = l_0_39 == (l_0_47 - l_0_47 % 256) / 256 and l_0_40 == l_0_47 % 256 and l_0_41 == (l_0_17 + (l_0_20) + 12 - (l_0_17 + (l_0_20) + 12) % 256) / 256 % 256 and l_0_42 == l_0_48
      end
      -- DECOMPILER ERROR at PC303: Confused about usage of register: R23 in 'UnsetPending'

      -- DECOMPILER ERROR at PC305: Confused about usage of register: R24 in 'UnsetPending'

      if l_0_0 < l_0_45 or not l_0_46 then
        return mp.CLEAN
      end
      local l_0_51 = nil
      local l_0_52 = nil
      local l_0_53 = false
      while 1 do
        -- DECOMPILER ERROR at PC320: Confused about usage of register: R26 in 'UnsetPending'

        -- DECOMPILER ERROR at PC322: Overwrote pending register: R27 in 'AssignReg'

        if nil ~= l_0_29 then
          l_0_53 = l_0_30 - 16 >= l_0_30 or l_0_53
          -- DECOMPILER ERROR at PC327: Confused about usage of register: R26 in 'UnsetPending'

          -- DECOMPILER ERROR at PC328: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC328: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      if l_0_53 then
        (mp.set_mpattributeex)("Lua:POSSIBLE_UPX_MAGIC", l_0_29)
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
    -- DECOMPILER ERROR: 17 unprocessed JMP targets
  end
end

