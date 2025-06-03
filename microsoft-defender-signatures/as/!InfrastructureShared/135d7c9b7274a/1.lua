-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\135d7c9b7274a\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED

