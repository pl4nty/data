-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4529daa6f07e\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.INFECTED
end
return mp.CLEAN

