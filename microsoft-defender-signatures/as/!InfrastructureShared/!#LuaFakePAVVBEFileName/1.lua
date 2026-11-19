-- Threat: !InfrastructureShared
-- Name: !#Lua:FakePAVVBEFileName
-- Type: 13

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -4) == ".vbe" then
  local l_0_1, l_0_2 = string.match(l_0_0, "(.+\\)([^\\]+)$")
  if string.sub(l_0_2, 1, 9) == "setup.exe" or string.sub(l_0_2, 1, 5) == "hello" then
    mp.set_mpattribute("Lua:FakePAVVBEFileName")
  end
end
return mp.CLEAN
