-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SuspADSyncAccessB!EntraConnect\Includes\1.luac 

-- params : ...
-- function num : 0
if IsADConnectRole() then
  (mp.readprotection)(false)
  local l_0_0 = (mp.getfilesize)()
  local l_0_1 = (mp.readfile)(0, l_0_0)
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, "microsoft.directoryservices.metadirectoryservices.cryptography.keymanager", 1, true) ~= nil and (string.find)(l_0_1, ".loadkeyset(", 1, true) ~= nil and (string.find)(l_0_1, ".getactivecredentialkey(", 1, true) ~= nil then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

