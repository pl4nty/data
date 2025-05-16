-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanScriptGoffRock\0x000014d2_luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:GoffRocker.Conf") >= 3 then
  return mp.INFECTED
end
return mp.CLEAN

