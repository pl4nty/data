-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxAllSectionsOverflow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = 1
local l_0_3 = 3
local l_0_4 = 62
local l_0_5 = 40
local l_0_6 = 183
local l_0_7 = elfhdr.ident
local l_0_8 = (string.byte)(l_0_7, 6)
if l_0_8 ~= l_0_2 or elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 and elfhdr.machine ~= l_0_5 and elfhdr.machine ~= l_0_6 then
  return mp.CLEAN
end
local l_0_9 = (mp.getfilesize)()
local l_0_10 = false
local l_0_11 = false
for l_0_15 = 1, elfhdr.shnum do
  local l_0_16 = esec[l_0_15]
  if l_0_16.type ~= l_0_0 and l_0_16.type ~= l_0_1 then
    l_0_11 = true
    if l_0_16.offset >= 0 and l_0_16.offset < l_0_9 and l_0_16.size >= 0 and l_0_16.size <= l_0_9 and l_0_16.offset + l_0_16.size <= l_0_9 then
      do
        do
          l_0_10 = true
          do break end
          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if not l_0_11 then
  return mp.CLEAN
end
if not l_0_10 then
  return mp.INFECTED
end
return mp.CLEAN

