-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPU2RD1\0x000016d7_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("!#SLF:PDF/Spike.B!rfn") or (mp.get_mpattribute)("!#ALF:PDF/Spike.A!rfn") or (mp.get_mpattribute)("!#ALF:PDF/Spike.B!rfn") then
  (mp.set_mpattribute)("PDF:ScanAllUris")
end
return mp.CLEAN

