-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJavaTabbyCatA!dha\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:TabbyCat.AA") >= 2 and (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "%.java$") then
  return mp.INFECTED
end
return mp.CLEAN

