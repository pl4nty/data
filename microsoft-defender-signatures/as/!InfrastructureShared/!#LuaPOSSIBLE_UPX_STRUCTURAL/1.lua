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
  local l_0_15 = 4
  local l_0_16 = 1685382481
  local l_0_17 = 0
  for l_0_21 = 1, elfhdr.phnum do
    local l_0_22 = (ephdrs[l_0_21]).type
    if l_0_22 == l_0_15 or l_0_22 == l_0_16 then
      local l_0_23 = (ephdrs[l_0_21]).filesz
      l_0_17 = l_0_17 + l_0_23 + (4 - l_0_23 % 4) % 4
    end
  end
  local l_0_24 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize + (l_0_17) + 12
  local l_0_25 = (string.byte)(elfhdr.ident, 6)
  local l_0_26 = mp.FOOTERPAGE_SZ - 32 - 4 + 1
  local l_0_27 = 80
  local l_0_28 = l_0_26 - l_0_27
  local l_0_29 = l_0_26
  local l_0_30 = false
  while 1 do
    while 1 do
      if l_0_28 <= l_0_29 and not l_0_30 then
        local l_0_31 = (mp.readu_u32)(footerpage, l_0_29 + 32)
        if l_0_25 == l_0_1 then
          local l_0_32 = l_0_31 % 256
          l_0_31 = (l_0_31 - l_0_32) / 256
          local l_0_33 = l_0_31 % 256
          l_0_31 = (l_0_31 - l_0_33) / 256
          local l_0_34 = l_0_31 % 256
          l_0_31 = (l_0_31 - l_0_34) / 256
          l_0_31 = l_0_32 * 16777216 + l_0_33 * 65536 + l_0_34 * 256 + l_0_31
        end
        do
          if l_0_31 == l_0_24 and l_0_31 < l_0_0 then
            l_0_30 = true
            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    l_0_29 = l_0_29 - 1
  end
  do
    do
      if l_0_30 then
        local l_0_35 = l_0_26 - (l_0_29)
        if l_0_35 > 0 then
          (mp.set_mpattributeex)("Lua:POSSIBLE_UPX_STRUCTURAL_SHIFTED", l_0_35)
        end
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

