-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLuaLinuxMalScripts\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:Linux/Trojan.mal_attr_") >= 3 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN

