-- Threat: !InfrastructureShared
-- Name: !#Lua:BewoebicBinaryFile
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan & MpNewlyCreatedHint & SCRIPT:TxtMzHexToBin

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 ~= nil and string.find(l_0_0, "\\appdata\\roaming\\bbwc\\", 1, true) then
  local l_0_1 = mp.getfilename()
  if ".txt" ~= string.sub(l_0_1, -4) then
    mp.set_mpattribute("Lua:BewoebicBinaryFile.A")
  else
    mp.set_mpattribute("Lua:BewoebicBinaryFile.B")
  end
  return mp.INFECTED
end
return mp.CLEAN
