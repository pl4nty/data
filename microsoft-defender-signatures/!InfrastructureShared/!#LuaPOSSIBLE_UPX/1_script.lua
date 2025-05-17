-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPOSSIBLE_UPX\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1 = 2
if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if (elfhdr.phnum ~= 3 and elfhdr.phnum ~= 2) or elfhdr.shnum ~= 0 then
  return mp.CLEAN
end
local l_0_2 = elfhdr.ident
local l_0_3 = (string.byte)(l_0_2, 6)
if elfhdr.phoff ~= elfhdr.ehsize then
  return mp.CLEAN
end
do
  local l_0_4 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize + 4 + 1
  if l_0_4 < mp.HEADERPAGE_SZ - 3 then
    local l_0_5 = (mp.readu_u32)(headerpage, l_0_4)
    if l_0_5 == 0 then
      return mp.CLEAN
    end
    local l_0_6 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
    local l_0_7 = (mp.readu_u32)(footerpage, l_0_6)
    local l_0_11 = l_0_7 == l_0_5
    repeat
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R9 in 'AssignReg'

    until (nil ~= l_0_5 and l_0_11) or l_0_6 <= l_0_6 - 80
    if not l_0_11 then
      return mp.CLEAN
    end
    local l_0_12 = nil
    local l_0_13 = nil
    if l_0_3 == l_0_1 then
      local l_0_14 = nil
      l_0_14 = (l_0_14 - (mp.readu_u32)(footerpage, l_0_6 + 32) % 256) / 256
      local l_0_15 = nil
      l_0_14 = (l_0_14 - l_0_14 % 256) / 256
      local l_0_16 = nil
      l_0_14 = (l_0_14 - l_0_14 % 256) / 256
      -- DECOMPILER ERROR at PC131: Confused about usage of register: R14 in 'UnsetPending'

      l_0_14 = l_0_15 * 16777216 + l_0_16 * 65536 + l_0_14 % 256 * 256 + l_0_14
    end
    -- DECOMPILER ERROR at PC134: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC145: Confused about usage of register: R11 in 'UnsetPending'

    if l_0_0 < l_0_14 or l_0_14 ~= elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize + 12 then
      return mp.CLEAN
    end
    local l_0_17 = nil
    local l_0_18 = false
    local l_0_19 = l_0_6 - 16
    while 1 do
      -- DECOMPILER ERROR at PC162: Overwrote pending register: R14 in 'AssignReg'

      if nil ~= l_0_5 then
        l_0_18 = l_0_19 >= l_0_6 or l_0_18
        l_0_19 = l_0_19 + 1
        -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    if l_0_18 then
      (mp.set_mpattributeex)("Lua:POSSIBLE_UPX_MAGIC", l_0_5)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR: 12 unprocessed JMP targets
end

