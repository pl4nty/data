-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\12d_281.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("RPF:CmdLineMLv2:100") or (mp.get_mpattribute)("RPF:CmdLineMLv2:130") or (mp.get_mpattribute)("RPF:CmdLineMLv2:150") then
  return mp.INFECTED
end
return mp.CLEAN

