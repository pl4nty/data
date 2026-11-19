-- Threat: !InfrastructureShared
-- Name: !#Lua:SpecificFileExtInDesktopFolder
-- Type: 13
-- MpAttributes: Lua:FileInsideUserDesktopFolder

if mp.get_mpattribute("Lua:BATExt") then
  mp.set_mpattribute("Lua:BatFileInDesktopFolder")
elseif mp.get_mpattribute("Lua:DLLExt") then
  mp.set_mpattribute("Lua:DllFileInDesktopFolder")
end
return mp.CLEAN
