-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32RDPCredsDumpA\0x00000288_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 307200000 or l_0_0 > 512000000 then
  return mp.CLEAN
end
local l_0_1 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000s\000v\000c\000h\000o\000s\000t\000.\000e\000x\000e\000\000"
local l_0_2 = "svchost.pdb"
local l_0_3 = "RdpCoreTS.pdb"
;
(mp.readprotection)(false)
local l_0_4 = tostring((mp.readfile)(8192, 24576))
local l_0_5 = tostring((mp.readfile)(49152, 90112))
;
(mp.readprotection)(true)
if l_0_4:find(l_0_1, 1, true) == nil or l_0_5:find(l_0_2, 1, true) == nil or l_0_5:find(l_0_3, 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED

