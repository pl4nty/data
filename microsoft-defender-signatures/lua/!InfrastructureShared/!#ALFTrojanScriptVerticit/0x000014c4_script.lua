-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanScriptVerticit\0x000014c4_luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:Verticite") >= 3 then
  return mp.INFECTED
end
return mp.CLEAN

