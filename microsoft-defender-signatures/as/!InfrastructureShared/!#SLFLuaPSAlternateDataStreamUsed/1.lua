-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:PSAlternateDataStreamUsed
-- Type: 13
-- MpAttributes: SCRIPT:PSCreateAlternateDataStream & Nscript:Type_ps

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("\\msft%.azure%.azure%-backup.-\\powershell%-module") or l_0_1:find("\\msft%.sme%.azure%-center.-\\powershell%-module") or l_0_1:find("\\sigma\\.+%.yml") then
    mp.set_mpattribute("Lua:AlterigoExclusion")
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
