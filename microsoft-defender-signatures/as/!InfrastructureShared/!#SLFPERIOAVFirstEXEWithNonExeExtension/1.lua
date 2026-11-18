-- Threat: !InfrastructureShared
-- Name: !#SLFPER:IOAVFirstEXEWithNonExeExtension
-- Type: 9
-- MpAttributes: RPF:PEHasIOAVURL & !//GIOAVFirstEXEWithNonExeExtension

if peattributes.isexe then
  local l_0_0 = string.lower(mp.getfilename())
  local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if (l_0_2:len() < 4 or string.sub(l_0_2, -4) ~= ".exe") and l_0_2:find(".exe->", 1, true) == nil then
    mp.set_mpattribute("//GIOAVFirstEXEWithNonExeExtension")
    return mp.INFECTED
  end
end
return mp.CLEAN
