-- Threat: HackTool:ASP/WitchSyndrome.AA!dha
-- Type: 13
-- MpAttributes: Lua:ASHXExt | Lua:ASPXExt | Lua:ASPExt

if #mp.enum_mpattributesubstring("SCPT:WitchSyndrome.AA") >= 10 then
  return mp.INFECTED
end
return mp.CLEAN
