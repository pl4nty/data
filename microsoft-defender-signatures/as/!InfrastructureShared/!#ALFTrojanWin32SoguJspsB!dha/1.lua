-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SoguJspsB!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1048576 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 10 then
  return mp.CLEAN
end
local l_0_1 = 77
for l_0_5 = 1, pehdr.NumberOfSections do
  if (pesecs[l_0_5]).Name == ".data" then
    local l_0_6 = (pesecs[l_0_5]).PointerToRawData
    local l_0_7 = (pesecs[l_0_5]).SizeOfRawData
    if l_0_6 ~= 0 and l_0_7 ~= 0 and l_0_6 + l_0_7 <= l_0_0 and l_0_1 <= l_0_7 then
      (mp.readprotection)(false)
      local l_0_8 = (mp.readfile)(l_0_6, l_0_1)
      ;
      (mp.readprotection)(true)
      local l_0_9 = (mp.readu_u32)(l_0_8, 1)
      local l_0_10 = (mp.readu_u32)(l_0_8, 64)
      local l_0_11 = (mp.readu_u32)(l_0_8, 73)
      if l_0_9 ~= 1000 and (mp.bitxor)(l_0_9, l_0_10) == 1000 and (mp.bitxor)(l_0_9, l_0_11) == 1000 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN

