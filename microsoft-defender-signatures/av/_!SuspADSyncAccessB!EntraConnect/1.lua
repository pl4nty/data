-- Threat: \x84!SuspADSyncAccess.B!EntraConnect
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: MpIsPowerShellAMSIScan & SCPT:AdsyncDB & !SCPT:gyotmodule

if IsADConnectRole() then
  mp.readprotection(false)
  local l_0_0 = mp.getfilesize()
  local l_0_1 = mp.readfile(0, l_0_0)
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "microsoft.directoryservices.metadirectoryservices.cryptography.keymanager", 1, true) ~= nil and string.find(l_0_1, ".loadkeyset(", 1, true) ~= nil and string.find(l_0_1, ".getactivecredentialkey(", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
