-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\195b35f0f05e6\0x00008a3b_luac 

-- params : ...
-- function num : 0
local l_0_0 = (this_sigattrlog[3]).utf8p2
if (sysio.IsFileExists)(l_0_0) then
  (bm.add_related_file)(l_0_0)
end
return mp.INFECTED

