-- Threat: !InfrastructureShared
-- Name: !#Lua:Helpers
-- Type: 13

if mp.readu_u32(headerpage, 5) == 151587081 and mp.getfilesize() > 200000000 and mp.crc32(-1, headerpage, 1, 1024) == 2898363002 and string.find(mp.getfilename(), "(RarSfx)", 1, true) then
  mp.set_mpattribute("Lua:AutoItRarSfxLargeScript")
  mp.set_mpattribute("//AutRarLrgScpt")
end
if mp.readu_u32(headerpage, 5) == 168626701 then
  local l_0_0 = mp.getfilesize()
  if 10000 < l_0_0 and l_0_0 <= 60000 and mp.crc32(-1, headerpage, 1, 256) == 1133461959 and string.find(mp.getfilename(), "(RarSfx)", 1, true) then
    mp.set_mpattribute("Lua:TrimWhiteSpaceAutoItRarSfxConfig")
  end
end
return mp.CLEAN
