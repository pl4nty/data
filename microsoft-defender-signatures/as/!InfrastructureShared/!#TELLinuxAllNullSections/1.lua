-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxAllNullSections\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
local l_0_1 = 1
local l_0_2 = 3
local l_0_3 = 62
local l_0_4 = 40
local l_0_5 = 183
local l_0_6 = elfhdr.ident
local l_0_7 = (string.byte)(l_0_6, 6)
if l_0_7 ~= l_0_1 or elfhdr.machine ~= l_0_2 and elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 and elfhdr.machine ~= l_0_5 then
  return mp.CLEAN
end
for l_0_11 = 1, elfhdr.shnum do
  local l_0_12 = esec[l_0_11]
  if l_0_12.type ~= l_0_0 and (l_0_12.offset ~= 0 or l_0_12.size ~= 0 or l_0_12.flags ~= 0 or l_0_12.addr ~= 0 or l_0_12.link ~= 0 or l_0_12.info ~= 0 or l_0_12.addralign ~= 0 or l_0_12.entsize ~= 0) then
    return mp.CLEAN
  end
end
;
(mp.set_mpattribute)("MpEnableSegmentBasedElfScanning")
return mp.INFECTED

