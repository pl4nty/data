-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2e78e5ea812b\0x0000bba1_luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = getDetectedRegions()
for l_0_4,l_0_5 in pairs(l_0_0) do
  if l_0_5.size <= 16384 and (l_0_5.prot == 32 or l_0_5.prot == 4) and l_0_5.state_type == (mp.bitor)(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
    return mp.INFECTED
  end
end
return mp.CLEAN

