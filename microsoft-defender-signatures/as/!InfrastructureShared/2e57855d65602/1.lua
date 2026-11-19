-- Threat: !InfrastructureShared
-- Name: 2e57855d65602
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 and mp.get_mpattribute("DOTNET_Reactor_Obfuscator") then
  return mp.INFECTED
end
return mp.CLEAN
