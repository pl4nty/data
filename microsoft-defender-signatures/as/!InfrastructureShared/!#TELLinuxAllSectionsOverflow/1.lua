-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxAllSectionsOverflow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = (mp.getfilesize)()
local l_0_3 = false
local l_0_4 = false
for l_0_8 = 1, elfhdr.shnum do
  local l_0_9 = esec[l_0_8]
  if l_0_9.type ~= l_0_0 and l_0_9.type ~= l_0_1 then
    l_0_4 = true
    if l_0_9.offset >= 0 and l_0_9.offset < l_0_2 and l_0_9.size >= 0 and l_0_9.size <= l_0_2 and l_0_9.offset + l_0_9.size <= l_0_2 then
      do
        do
          l_0_3 = true
          do break end
          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN

