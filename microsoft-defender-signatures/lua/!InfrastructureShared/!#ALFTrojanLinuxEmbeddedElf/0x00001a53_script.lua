-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanLinuxEmbeddedElf\0x00001a53_luac 

-- params : ...
-- function num : 0
if mp.HEADERPAGE_SZ < 4096 then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find(",v", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("\\vfscache\\", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("smartstage", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("xl.meta", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".pb", 1, true) then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = 0
for l_0_5 = 1, mp.HEADERPAGE_SZ - 4 do
  if (mp.readu_u32)(headerpage, l_0_5) == 1179403647 then
    local l_0_6 = (mp.readu_u32)(headerpage, l_0_5 + 4)
    if l_0_6 == 65794 or l_0_6 == 65793 then
      do
        do
          l_0_1 = l_0_5 - 1
          do break end
          -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_1 ~= 0 then
  (mp.readprotection)(true)
  return mp.INFECTED
end
;
(mp.readprotection)(true)
return mp.CLEAN

