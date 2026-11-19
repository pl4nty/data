-- Threat: HackTool:ASP/WitchSyndrome.BB!dha
-- Type: 13
-- MpAttributes: Lua:ASHXExt | Lua:ASPXExt | Lua:ASPExt

if #mp.enum_mpattributesubstring("SCPT:WitchSyndrome.BB") >= 8 then
  return mp.INFECTED
end
return mp.CLEAN
