-- Threat: !InfrastructureShared
-- Name: !#Lua:SpecificFileExtInWindowsFolder
-- Type: 13
-- MpAttributes: Lua:FileInsideWindowsFolder

if mp.get_mpattribute("Lua:BATExt") then
  mp.set_mpattribute("Lua:BatFileInWindowsFolder")
end
return mp.CLEAN
