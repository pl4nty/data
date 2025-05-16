-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001cc5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if #(mp.GetProcessCommandLine)(l_0_0) > 200 then
  return mp.CLEAN
end
return mp.INFECTED

