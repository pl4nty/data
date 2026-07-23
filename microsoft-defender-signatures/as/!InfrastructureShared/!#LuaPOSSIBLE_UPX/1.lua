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
  local l_0_17 = 4
  local l_0_18 = 1685382481
  local l_0_19 = 0
  for l_0_23 = 1, elfhdr.phnum do
    local l_0_24 = (ephdrs[l_0_23]).type
    if l_0_24 == l_0_17 or l_0_24 == l_0_18 then
      local l_0_25 = (ephdrs[l_0_23]).filesz
      l_0_19 = l_0_19 + l_0_25 + (4 - l_0_25 % 4) % 4
    end
  end
  do
    local l_0_26 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize + (l_0_19) + 4 + 1
    if l_0_26 < mp.HEADERPAGE_SZ - 3 then
      local l_0_27 = (mp.readu_u32)(headerpage, l_0_26)
      if l_0_27 == 0 then
        return mp.CLEAN
      end
      local l_0_28 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
      local l_0_29 = (mp.readu_u32)(footerpage, l_0_28)
      local l_0_33 = l_0_29 == l_0_27
      repeat
        -- DECOMPILER ERROR at PC172: Overwrote pending register: R15 in 'AssignReg'

      until (nil ~= l_0_27 and l_0_33) or l_0_28 <= l_0_28 - 80
      if not l_0_33 then
        return mp.CLEAN
      end
      local l_0_34 = nil
      local l_0_35 = nil
      if l_0_16 == l_0_1 then
        local l_0_36 = nil
        l_0_36 = (l_0_36 - (mp.readu_u32)(footerpage, l_0_28 + 32) % 256) / 256
        local l_0_37 = nil
        l_0_36 = (l_0_36 - l_0_36 % 256) / 256
        local l_0_38 = nil
        l_0_36 = (l_0_36 - l_0_36 % 256) / 256
        -- DECOMPILER ERROR at PC207: Confused about usage of register: R20 in 'UnsetPending'

        l_0_36 = l_0_37 * 16777216 + l_0_38 * 65536 + l_0_36 % 256 * 256 + l_0_36
      end
      -- DECOMPILER ERROR at PC210: Confused about usage of register: R17 in 'UnsetPending'

      -- DECOMPILER ERROR at PC222: Confused about usage of register: R17 in 'UnsetPending'

      if l_0_0 < l_0_36 or l_0_36 ~= elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize + (l_0_19) + 12 then
        return mp.CLEAN
      end
      local l_0_39 = nil
      local l_0_40 = false
      local l_0_41 = l_0_28 - 16
      while 1 do
        -- DECOMPILER ERROR at PC239: Overwrote pending register: R20 in 'AssignReg'

        if nil ~= l_0_27 then
          l_0_40 = l_0_41 >= l_0_28 or l_0_40
          l_0_41 = l_0_41 + 1
          -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      if l_0_40 then
        (mp.set_mpattributeex)("Lua:POSSIBLE_UPX_MAGIC", l_0_27)
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

