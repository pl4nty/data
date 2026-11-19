-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:JavaScript/DuckSong.A!dha
-- Type: 13
-- MpAttributes: LuaJsLT10kb

if #mp.enum_mpattributesubstring("SCPT:DuckSong.A") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
