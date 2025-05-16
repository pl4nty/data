-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000011e4_luac 

-- params : ...
-- function num : 0
if (mp.get_sigattr_event_count)(16395) > 10 then
  return mp.INFECTED
end
return mp.CLEAN

