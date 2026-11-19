-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileJSInZip
-- Type: 13
-- MpAttributes: Lua:JSExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:SingleFileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  local l_0_2, l_0_3 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
  if l_0_2 == 0 and l_0_3 then
    mp.set_mpattribute("Lua:FileJSInZip")
  end
  return mp.CLEAN
end
return mp.INFECTED
