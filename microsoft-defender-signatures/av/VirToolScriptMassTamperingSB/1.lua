-- Threat: VirTool:Script/MassTampering.SB
-- Type: 13
-- MpAttributes: (Lua:BATExt | Lua:CMDExt)

if #mp.enum_mpattributesubstring("SCPT:DisableRTP.STB") >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
