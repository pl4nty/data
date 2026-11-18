-- Threat: !InfrastructureShared
-- Name: !#Lua:KunpalAttachmentFilename
-- Type: 8

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "mahnung.exe" or l_0_1 == "mahnung.pdf.exe" or l_0_1 == "rechnung.exe" then
    mp.set_mpattribute("Lua:KunpalAttachmentFilename")
  end
end
return mp.CLEAN
