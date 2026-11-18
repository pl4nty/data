-- Threat: \x88!Upatre.gen!CD
-- Type: 10
-- MpAttributes: HSTR:Win32/Obfuscator.Cutwail_Upatre_GameOver | SIGATTR:Obfuscator_possible_upatre | HSTR:Win32/Obfuscator.Cutwail_Upatre_GameOver_2

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  if peattributes.isdll then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 17920 or 44288 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)))
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.sub(l_0_3, -4) == ".exe" and l_0_2:sub(-5) == "\\temp" and l_0_3:find("%l%l%l%l%l%.exe") == 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
