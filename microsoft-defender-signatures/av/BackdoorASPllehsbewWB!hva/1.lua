-- Threat: Backdoor:ASP/llehsbewW.B!hva
-- Type: 13
-- Includes: HvaLookupHelpers, BMLuaLib
-- MpAttributes: (ALF:Backdoor:ASP/PossibleWebshell.B | ALF:Backdoor:ASP/PossibleWebshell.C | ALF:Backdoor:ASP/PossibleWebshell.D | AGGR:JscriptArtifacts.A)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") == nil and string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") == nil then
  return mp.CLEAN
end
if IsExchangeServer() then
  return mp.INFECTED
end
if IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and l_0_1.DeviceRoles.ExchangeServer ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
