-- Threat: HackTool:ASP/WitchSyndrome.CC!dha
-- Type: 13
-- MpAttributes: Lua:ASHXExt | Lua:ASPXExt | Lua:ASPExt

if #mp.enum_mpattributesubstring("SCPT:WitchSyndrome.CC") >= 6 then
  return mp.INFECTED
end
return mp.CLEAN
