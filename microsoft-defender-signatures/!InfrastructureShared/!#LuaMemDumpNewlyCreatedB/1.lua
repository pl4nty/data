-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaMemDumpNewlyCreatedB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.readu_u32)(headerpage, 9)
if l_0_0 == nil or l_0_0 <= 0 or l_0_0 >= 32 then
  return mp.CLEAN
end
local l_0_1 = (mp.readu_u32)(headerpage, 13)
if l_0_1 == nil or l_0_1 == 0 then
  return mp.CLEAN
end
for l_0_5 = 0, l_0_0 - 1 do
  local l_0_6 = l_0_1 + l_0_5 * 12
  local l_0_7 = (mp.readu_u32)(headerpage, l_0_6 + 1)
  local l_0_8 = (mp.readu_u32)(headerpage, l_0_6 + 9)
  if l_0_7 == 4 then
    (mp.readprotection)(false)
    local l_0_9 = (mp.readfile)(l_0_8 + 24, 4)
    if l_0_9 == nil then
      return mp.CLEAN
    end
    l_0_9 = (mp.readu_u32)(l_0_9, 1)
    local l_0_10 = (mp.readfile)(l_0_9, 4)
    if l_0_10 == nil then
      return mp.CLEAN
    end
    local l_0_11 = (mp.readu_u32)(l_0_10, 1)
    if l_0_11 == nil or l_0_11 == 0 or l_0_11 >= 256 then
      return mp.CLEAN
    end
    local l_0_12 = (mp.readfile)(l_0_9 + 4, l_0_11)
    if l_0_12 == nil then
      return mp.CLEAN
    end
    local l_0_13 = (string.gsub)(l_0_12, "%z", "")
    l_0_13 = (string.lower)(l_0_13)
    do
      do
        if (string.find)(l_0_13, "c:\\windows\\system32\\lsasrv.dll", 1, true) then
          local l_0_14 = (mp.readu_u64)(headerpage, 25)
          ;
          (mp.set_mpattribute)("LUA:MemDumpType_" .. (string.format)("%x", l_0_14))
          ;
          (mp.set_mpattribute)("BM_MEMDUMP_FILE_LSASRV")
          return mp.INFECTED
        end
        do break end
        -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
return mp.CLEAN

