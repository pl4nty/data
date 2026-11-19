-- Threat: !InfrastructureShared
-- Name: !#Lua:UpatreDownloadFileName.E
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:sub(1, 3) == "doc" and l_0_1:sub(-8) == "_pdf.exe" then
    mp.set_mpattribute("Lua:UpatreDownloadFileName.E")
  end
end
return mp.CLEAN
