-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxAllNullSections\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
for l_0_4 = 1, elfhdr.shnum do
  local l_0_5 = esec[l_0_4]
  if l_0_5.type ~= l_0_0 and (l_0_5.offset ~= 0 or l_0_5.size ~= 0 or l_0_5.flags ~= 0 or l_0_5.addr ~= 0 or l_0_5.link ~= 0 or l_0_5.info ~= 0 or l_0_5.addralign ~= 0 or l_0_5.entsize ~= 0) then
    return mp.CLEAN
  end
end
return mp.INFECTED

