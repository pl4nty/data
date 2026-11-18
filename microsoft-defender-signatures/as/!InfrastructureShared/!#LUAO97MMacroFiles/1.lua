-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/MacroFiles
-- Type: 13
-- MpAttributes: MHSTR:MacroInside

local l_0_0 = mp.getfilesize()
if 10240000 <= l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 102400 then
  mp.set_mpattribute("LUA:O97M/MacroFiles_FileSizeBorder")
else
  local l_0_1 = 0
  if mp.get_mpattribute("MHSTR:MacroJustEnviron") or mp.get_mpattribute("MHSTR:MacroGetEnvironmentVariable") then
    l_0_1 = l_0_1 + 1
  end
  if mp.get_mpattribute("MHSTR:MacroExecute") then
    l_0_1 = l_0_1 + 1
  end
  if mp.get_mpattribute("MHSTR:MacroDownload") or mp.get_mpattribute("MHSTR:MacroHTTPRequest") then
    l_0_1 = l_0_1 + 1
  end
  if mp.get_mpattribute("MHSTR:MacroConcatVariations") or mp.get_mpattribute("MHSTR:MacroJustConcatVariations") or mp.get_mpattribute("MHSTR:MacroJustConcatChrVariations") then
    l_0_1 = l_0_1 + 1
  end
  if l_0_0 < 1024000 and 2 <= l_0_1 then
    mp.set_mpattribute("LUA:O97M/MacroFilesAttributeCheck.A")
  elseif 3 <= l_0_1 then
    mp.set_mpattribute("LUA:O97M/MacroFilesAttributeCheck.B")
  end
end
return mp.CLEAN
