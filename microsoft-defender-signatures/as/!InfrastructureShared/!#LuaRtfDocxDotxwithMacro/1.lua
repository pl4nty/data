-- Threat: !InfrastructureShared
-- Name: !#Lua:RtfDocxDotxwithMacro
-- Type: 13
-- MpAttributes: MHSTR:MacroInside

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, ".docx->word/vbaproject.bin", 1, true) or string.find(l_0_0, ".rtf->word/vbaproject.bin", 1, true) or string.find(l_0_0, ".dotx->word/vbaproject.bin", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
