-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6878d855c0b2\0x00000d1b_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if isnull(l_0_0) or mp.HSTR_CALLER_SMS ~= l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED

