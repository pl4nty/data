-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:ASPX/CrabBrain.A!dha
-- Type: 13
-- MpAttributes: Lua:ASPXExt | Lua:ASPExt

if #mp.enum_mpattributesubstring("SCPT:CrabBrain.A") >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
